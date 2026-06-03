package com.mycompany.restaurante.controller;

import com.mycompany.restaurante.App;
import com.mycompany.restaurante.dao.AsistenciaDAO;
import com.mycompany.restaurante.modelo.pojo.Asistencia;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

/**
 * Controlador encargado de gestionar el módulo de asistencia del personal.
 * Procesa registros de entrada y salida, calcula automáticamente las horas 
 * trabajadas y mantiene sincronizada la tabla visual con la base de datos.
 * * @author Stephanie Prieto
 */
public class AsistenciaController {

    @FXML private TextField lblUsuario; 
    @FXML private ComboBox<String> CmbRol; 
    @FXML private ComboBox<String> CmbHoraEntrada;
    @FXML private ComboBox<String> CmbHoraSalida;
    @FXML private TextField txtHorasTotales;
    @FXML private Button btnRegistrarAsistencia;
    @FXML private TableView<Asistencia> tablaAsistencia; 

    @FXML private TableColumn<Asistencia, String> columnaUsuario;
    @FXML private TableColumn<Asistencia, String> columnaEntrada;
    @FXML private TableColumn<Asistencia, String> columnaSalida;
    @FXML private TableColumn<Asistencia, String> columnaEstado;
    @FXML private TableColumn<Asistencia, String> columnaHorasTrabajadas; 

    private AsistenciaDAO asistenciaDAO;
    private ObservableList<Asistencia> listaAsistencias = 
            FXCollections.observableArrayList();
    private final DateTimeFormatter formatter = 
            DateTimeFormatter.ofPattern("HH:mm");

    /**
     * Prepara y configura los elementos visuales al cargar la pantalla.
     * Instancia el acceso a datos y enlaza los listeners reactivos.
     */
    @FXML
    public void initialize() {
        asistenciaDAO = new AsistenciaDAO(); 

        configurarTabla();
        cargarDatosIniciales();
        actualizarTablaDesdeBD(); 

        CmbHoraEntrada.setOnAction(e -> calcularHorasAutomatico());
        CmbHoraSalida.setOnAction(e -> calcularHorasAutomatico());
    }

    /**
     * Vincula las columnas de la tabla con las propiedades del modelo.
     */
    private void configurarTabla() {
        columnaUsuario.setCellValueFactory(new PropertyValueFactory<>("usuario"));
        columnaEntrada.setCellValueFactory(new PropertyValueFactory<>("entrada"));
        columnaSalida.setCellValueFactory(new PropertyValueFactory<>("salida"));
        columnaEstado.setCellValueFactory(new PropertyValueFactory<>("estado"));
        columnaHorasTrabajadas.setCellValueFactory(
                new PropertyValueFactory<>("horasTrabajadas"));
        tablaAsistencia.setItems(listaAsistencias);
    }
    
    /**
     * Consulta la base de datos para recuperar los registros del día en curso.
     */
    private void actualizarTablaDesdeBD() {
        if (asistenciaDAO != null) {
            listaAsistencias.setAll(asistenciaDAO.obtenerAsistenciasHoy());
        }
    }

    /**
     * Rellena los ComboBox con los roles operativos e intervalos de tiempo.
     */
    private void cargarDatosIniciales() {
        CmbRol.getItems().addAll(
                "Gerente", "Mesero", "Chef", "Cajero", "Recepcionista");
        LocalTime tiempo = LocalTime.of(7, 0);
        while (tiempo.isBefore(LocalTime.of(23, 1))) {
            String hora = tiempo.format(formatter);
            CmbHoraEntrada.getItems().add(hora);
            CmbHoraSalida.getItems().add(hora);
            tiempo = tiempo.plusMinutes(30);
        }
    }

    /**
     * Calcula la diferencia de tiempo entre la entrada y salida seleccionadas.
     */
    private void calcularHorasAutomatico() {
        String entradaStr = CmbHoraEntrada.getValue();
        String salidaStr = CmbHoraSalida.getValue();

        if (entradaStr != null && salidaStr != null) {
            LocalTime entrada = LocalTime.parse(entradaStr, formatter);
            LocalTime salida = LocalTime.parse(salidaStr, formatter);

            if (salida.isAfter(entrada)) {
                Duration duracion = Duration.between(entrada, salida);
                txtHorasTotales.setText(String.format("%02d:%02d hrs", 
                        duracion.toHours(), duracion.toMinutesPart()));
            } else {
                txtHorasTotales.setText("00:00 hrs");
            }
        }
    }

    /**
     * Captura y valida los datos del formulario para procesar el registro.
     * @param event Evento disparado por el botón de registro.
     */
    @FXML
    private void registrarAsistencia(ActionEvent event) {
        try {
            String usuario = lblUsuario.getText().trim();
            String rol = CmbRol.getValue(); 
            String entrada = CmbHoraEntrada.getValue();
            String salida = CmbHoraSalida.getValue();

            if (usuario.isEmpty() || rol == null 
                    || (entrada == null && salida == null)) {
                mostrarAlerta("Campos incompletos", 
                        "Por favor completa el nombre, rol y al menos una hora.");
                return;
            }

            if (asistenciaDAO.procesarAsistenciaCompleta(usuario, rol, 
                    entrada, salida, txtHorasTotales.getText())) {
                actualizarTablaDesdeBD();
                mostrarAlertaExito("Registro Exitoso", 
                        "Asistencia de " + usuario + " guardada.");
                limpiarCampos();
            } else {
                mostrarAlerta("Error de Validación", 
                        "El usuario no existe o el rol es incorrecto.");
            }
        } catch (Exception e) {
            mostrarAlerta("Error", "Error al procesar: " + e.getMessage());
        }
    }

    /**
     * Retorna la navegación a la vista principal del sistema (Dashboard).
     * @param event Evento disparado por el botón de regresar.
     */
    @FXML
    private void volverDashboard(ActionEvent event) {
        try {
            // Carga explícita mediante recursos para prevenir fallos de caché
            FXMLLoader loader = new FXMLLoader(
                    getClass().getResource("/fxml/Dashboard.fxml"));
            Parent root = loader.load();
            
            // Re-inyección contextual de la sesión global activa
            DashboardController dashCtrl = loader.getController();
            if (dashCtrl != null && App.usuarioLogueado != null) {
                dashCtrl.configurarUsuario(App.usuarioLogueado);
            }

            Stage stage = (Stage) ((Node) event.getSource())
                    .getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Panel de Control - Staff");
            stage.centerOnScreen();
            stage.show();
        } catch (IOException ex) {
            System.err.println("Error al regresar al Dashboard desde Asistencia: " 
                    + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void limpiarCampos() {
        lblUsuario.clear();
        CmbRol.getSelectionModel().clearSelection();
        CmbHoraEntrada.getSelectionModel().clearSelection();
        CmbHoraSalida.getSelectionModel().clearSelection();
        txtHorasTotales.setText("00:00 hrs");
    }

    private void mostrarAlerta(String titulo, String mensaje) {
        Alert alert = new Alert(Alert.AlertType.WARNING);
        alert.setTitle(titulo);
        alert.setHeaderText(null);
        alert.setContentText(mensaje);
        alert.showAndWait();
    }

    private void mostrarAlertaExito(String titulo, String mensaje) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION); 
        alert.setTitle(titulo);
        alert.setHeaderText(null);
        alert.setContentText(mensaje);
        alert.showAndWait();
    }

    @FXML
    private void cerrarSesion(ActionEvent event) {
        try {
            FXMLLoader loader = App.getFXMLLoader("Login"); 
            Parent root = loader.load();
            Stage stage = (Stage) ((Node) event.getSource())
                    .getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Login - Restaurante");
            stage.show();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}