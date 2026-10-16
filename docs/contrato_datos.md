# Contratos de datos - Servi Taxi

## 1. Usuarios

**Archivo:** `assets/data/usuarios.json`  
**Responsable:** Nallely

- **Campo:** `id`  
  **Tipo:** `int`  
  **Descripción:** Identificador único del usuario.

- **Campo:** `nombre`  
  **Tipo:** `String`  
  **Descripción:** Nombre completo del usuario registrado.

- **Campo:** `usuario`  
  **Tipo:** `String`  
  **Descripción:** Nombre de usuario utilizado para iniciar sesión en la aplicación.

- **Campo:** `claveAcceso`  
  **Tipo:** `String`  
  **Descripción:** Contraseña ficticia utilizada para validar el acceso a la aplicación.

Se utilizarán únicamente cuentas ficticias.

## 2. Servicios de transporte

**Archivo:** `assets/data/servicios.json`  
**Responsable:** Nallely

- **Campo:** `id`  
  **Tipo:** `int`  
  **Descripción:** Identificador único del servicio de transporte.

- **Campo:** `nombre`  
  **Tipo:** `String`  
  **Descripción:** Nombre del servicio de transporte disponible.

- **Campo:** `descripcion`  
  **Tipo:** `String`  
  **Descripción:** Información general sobre las características del servicio.

- **Campo:** `imagen`  
  **Tipo:** `String`  
  **Descripción:** Dirección URL de la imagen representativa del servicio.

- **Campo:** `capacidad`  
  **Tipo:** `int`  
  **Descripción:** Número máximo de pasajeros que puede transportar el vehículo.

- **Campo:** `tarifaBase`  
  **Tipo:** `double`  
  **Descripción:** Costo inicial del servicio antes de calcular la distancia recorrida.

- **Campo:** `precioKm`  
  **Tipo:** `double`  
  **Descripción:** Precio establecido por cada kilómetro del recorrido.

- **Campo:** `caracteristicas`  
  **Tipo:** `List<String>`  
  **Descripción:** Lista de características particulares del servicio de transporte.

Los servicios disponibles serán Mototaxi, Moto Rápido y Taxi Rápido.

## 3. Lugares

**Archivo:** `assets/data/lugares.json`  
**Responsable:** Abelardo

- **Campo:** `id`  
  **Tipo:** `int`  
  **Descripción:** Identificador único del lugar disponible.

- **Campo:** `nombre`  
  **Tipo:** `String`  
  **Descripción:** Nombre del lugar que el usuario podrá seleccionar como origen o destino.

Se utilizarán lugares previamente registrados para simular los recorridos.

## 4. Rutas

**Archivo:** `assets/data/rutas.json`  
**Responsable:** Abelardo

- **Campo:** `id`  
  **Tipo:** `int`  
  **Descripción:** Identificador único de la ruta registrada.

- **Campo:** `origenId`  
  **Tipo:** `int`  
  **Descripción:** Identificador del lugar donde inicia el recorrido.

- **Campo:** `destinoId`  
  **Tipo:** `int`  
  **Descripción:** Identificador del lugar donde finaliza el recorrido.

- **Campo:** `distanciaKm`  
  **Tipo:** `double`  
  **Descripción:** Distancia estimada entre el origen y destino, expresada en kilómetros.

Las rutas deberán relacionarse con lugares existentes. Cada sentido del recorrido deberá registrarse por separado cuando esté disponible.

## 5. Modelo Viaje

**Archivo:** Modelo Dart ubicado en `lib/features/viajes/models/`  
**Responsable:** Abelardo

- **Campo:** `servicio`  
  **Tipo:** `ServicioTransporte`  
  **Descripción:** Servicio de transporte seleccionado por el usuario.

- **Campo:** `origen`  
  **Tipo:** `Lugar`  
  **Descripción:** Lugar donde comenzará el viaje.

- **Campo:** `destino`  
  **Tipo:** `Lugar`  
  **Descripción:** Lugar donde finalizará el viaje.

- **Campo:** `ruta`  
  **Tipo:** `Ruta`  
  **Descripción:** Ruta registrada que relaciona el origen y destino seleccionados.

- **Campo:** `costoEstimado`  
  **Tipo:** `double`  
  **Descripción:** Importe estimado del viaje, calculado según la tarifa base, la distancia y el precio por kilómetro.

El modelo Viaje se construirá durante la cotización y permanecerá en memoria, sin almacenarse en un archivo JSON.

## 6. Reglas de cotización

**Responsable:** Abelardo

El costo estimado de cada viaje se calculará mediante la siguiente fórmula:

**Costo estimado = tarifaBase + (distanciaKm × precioKm)**

**Condiciones:**

- El usuario deberá seleccionar un origen y un destino.
- El origen y el destino no podrán ser iguales.
- La ruta seleccionada deberá existir en los datos registrados.
- Las distancias y tarifas serán valores demostrativos.
- Los importes se mostrarán con dos decimales.
- No se realizarán cobros reales.

## 7. Navegación de la aplicación

**Responsables:** Nallely y Abelardo

La aplicación contará con seis pantallas organizadas en el siguiente orden:

1. **LoginScreen:** permite iniciar sesión mediante una cuenta ficticia.
2. **ServiciosScreen:** muestra el catálogo de servicios de transporte disponibles.
3. **DetalleServicioScreen:** presenta la información detallada del servicio seleccionado.
4. **SeleccionRecorridoScreen:** permite seleccionar el lugar de origen y destino.
5. **CotizacionScreen:** muestra la distancia y el costo estimado del recorrido.
6. **ConfirmacionScreen:** presenta la confirmación simulada del viaje.

Los modelos utilizarán `factory fromJson` para convertir los registros JSON en objetos Dart.

La información seleccionada se transmitirá entre pantallas mediante constructores.