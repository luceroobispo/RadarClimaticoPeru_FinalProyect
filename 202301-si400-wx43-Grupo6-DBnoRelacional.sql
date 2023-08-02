use RadarClimaticoPeru;

// PROVINCIA --------------------------------------------------
db.createCollection(
  "provincia",
  {
    validator:
    {
      $jsonSchema:
      {
        required: ["nombre"],
        properties:
        {
          nombre:
          {
            bsonType: "string",
            description: "Debe ingresar el nombre de la provincia"
          }
        }
      }
    },
    validationAction: "error"
  }
);

db.provincia.insertMany([
    {
     _id: "PR001",
     nombre: "Amazonas"
    },
    {
    _id: "PR002",
     nombre: "Lima"
    },
    {
    _id: "PR003",
    nombre: "Huancayo"
    },
    {
    _id: "PR004",
    nombre: "Iquitos"
    },
    {
    _id: "PR005",
    nombre: "Cajamarca"
    },
    {
   _id: "PR006",
   nombre: "Ayacucho"
   },
   {
   _id: "PR007",
   nombre: "Huanuco"
   },
   {
   _id: "PR008",
   nombre: "Lambayeque"
   },
   {
   _id: "PR009",
   nombre: "Puno"
   }
])

db.provincia.find()

// DISTRITO --------------------------------------------------
db.createCollection(
  "distrito",
  {
    validator:
    {
      $jsonSchema:
      {
        required: ["nombre"],
        properties:
        {
          nombre:
          {
            bsonType: "string",
            description: "Debe ingresar el nombre del distrito"
          }
        }
      }
    },
    validationAction: "error"
  }
);

db.distrito.insertMany([
  {
    _id: "D001",
    nombre: "Selva Media",
    idProvincia: "PR001"
  },
  {
    _id: "D002",
    nombre: "Lima",
    idProvincia: "PR002"
  },
  {
    _id: "D003",
    nombre: "Chilca",
    idProvincia: "PR003"
  },
  {
    _id: "D004",
    nombre: "Colca",
    idProvincia: "PR003"
  },
  {
    _id: "D005",
    nombre: "Belen",
    idProvincia: "PR004"
  },
  {
   _id: "D006",
   nombre: "Puquio",
   idProvincia: "PR006"
  },
  {
    _id: "D007",
    nombre: "Quisqui",
    idProvincia: "PR007"
  },
  {
    _id: "D008",
    nombre: "Olmos",
    idProvincia: "PR008"
  },
  {
    _id: "D009",
    nombre: "Huata",
    idProvincia: "PR009"
  }
])

db.distrito.find()

// REPORTE DEL CLIMA  --------------------------------------------------
db.createCollection
(
    "ReporteClima",
    {
        validator:
        {
            $jsonSchema:
            {
                required: ["_id","institucion", "fecha", "hora", "nivelUrgencia", "descripcion", "idDistrito"],
                properties:
                {
                    _id:
                    {
                        bsonType:"string",
                        description:"debe de ingresar el id del reporte del clima"
                    },
                    institucion:
                    {
                        bsonType:"string",
                        description:"debe de ingresar el nombre de la institucion que creo el reporte"
                    },
                    fecha:
                    {
                        bsonType:"date",
                        description:"debe de ingresar la fecha del reporte del clima"
                    },
                    hora:
                    {
                        bsonType:"string",
                        description:"debe de ingresar la hora en que se envio el reporte"
                    },
                    nivelUrgencia:
                    {
                        bsonType:"string",
                        enum: ["ALTO", "MEDIO", "BAJO"],
                        description:"debe de ingresar el nivel de urgencia del reporte"
                    },
                    descripcion:
                    {
                        bsonType:"object", // contenido del reporte
                        required: ["temperatura", "precipitacion", "humedad", "velocidadViento", "direccionViento", "condicionCielo"],
                        properties:
                        {
                            temperatura:
                            {
                                bsonType:"double",
                                minimum: -89.99,
                                maximum: 51.99,
                                description:"debe de ingresar la temperatura en el rango [-89, 51]"
                            },
                            precipitacion:
                            {
                                bsonType:"double",
                                minimum: 0.01,
                                maximum: 30.01,
                                description:"debe de ingresar la precipitacion en el rango [0, 30]"
                            },
                            humedad:
                            {
                                bsonType:"double",
                                minimum: 0.01,
                                maximum: 100.01,
                                description:"debe de ingresar la humedad en el rango [0, 100]"
                            },
                            velocidadViento:
                            {
                                bsonType:"double",
                                minimum: 20.01,
                                maximum: 61.1,
                                description:"debe de ingresar la velocidad del viento en el rango [20, 61]"
                            },
                            direccionViento:
                            {
                                bsonType:"string",
                                enum: ["este", "oeste", "norte", "sur"],
                                description:"debe de ingresar la direccion del viento"
                            },
                            condicionCielo:
                            {
                                bsonType:"string",
                                enum: ["despejado", "cubierto de nubes", "probabilidad de precipitaciones"],
                                description:"debe de ingresar la condicion del cielo"
                            },
                        }
                    },
                    idDistrito:
                    {
                        bsonType:"string",
                        description:"debe de ingresar el id del distrito en que se baso el reporte"
                    }
                }
            }
        }
    }
);

db.ReporteClima.insertMany([
    {
        _id: "RC001",
        institucion: "INGEMMET",
        fecha: ISODate('2023-06-10'),
        hora: "6:00 AM",
        nivelUrgencia: "ALTO",
        descripcion:
        {
            temperatura: -10.13,
            precipitacion: 5.45,
            humedad: 50.10,
            velocidadViento: 30.30,
            direccionViento: "norte",
            condicionCielo: "probabilidad de precipitaciones"
        },
        idDistrito: "D001"
    },
    {
        _id: "RC002",
        institucion: "IGP",
        fecha: ISODate('2023-06-10'),
        hora: "10:00 AM",
        nivelUrgencia: "BAJO",
        descripcion:
        {
            temperatura: 23.30,
            precipitacion: 0.03,
            humedad: 10.40,
            velocidadViento: 20.30,
            direccionViento: "este",
            condicionCielo: "despejado"
        },
        idDistrito: "D002"
    },
    {
        _id: "RC003",
        institucion: "IGP",
        fecha: ISODate('2023-06-11'),
        hora: "3:00 PM",
        nivelUrgencia: "MEDIO",
        descripcion:
        {
            temperatura: 11.07,
            precipitacion: 15.03,
            humedad: 40.40,
            velocidadViento: 50.70,
            direccionViento: "norte",
            condicionCielo: "cubierto de nubes"
        },
        idDistrito: "D001"
    },
    {
        _id: "RC004",
        institucion: "INGEMMET",
        fecha: ISODate('2023-06-11'),
        hora: "12:00 AM",
        nivelUrgencia: "BAJO",
        descripcion:
        {
            temperatura: 34.04,
            precipitacion: 1.06,
            humedad: 5.60,
            velocidadViento: 20.11,
            direccionViento: "sur",
            condicionCielo: "despejado"
        },
        idDistrito: "D002"
    },
    {
        _id: "RC005",
        institucion: "INGEMMET",
        fecha: ISODate('2023-06-14'),
        hora: "04:30 PM",
        nivelUrgencia: "MEDIO",
        descripcion:
        {
            temperatura: 4.04,
            precipitacion: 5.11,
            humedad: 60.21,
            velocidadViento: 30.11,
            direccionViento: "sur",
            condicionCielo: "probabilidad de precipitaciones"
        },
        idDistrito: "D004"
    },
    {
        _id: "RC006",
        institucion: "INGEMMET",
        fecha: ISODate('2023-06-24'),
        hora: "06:30 PM",
        nivelUrgencia: "MEDIO",
        descripcion:
        {
            temperatura: 7.08,
            precipitacion: 6.12,
            humedad: 58.21,
            velocidadViento: 33.08,
            direccionViento: "este",
            condicionCielo: "cubierto de nubes"
        },
        idDistrito: "D006"
    },
    {
        _id: "RC007",
        institucion: "InstitucionPeruanadelclima",
        fecha: ISODate('2023-06-25'),
        hora: "2:45 PM",
        nivelUrgencia: "MEDIO",
        descripcion:
        {
            temperatura: 4.55,
            precipitacion: 5.50,
            humedad: 50.31,
            velocidadViento: 22.15,
            direccionViento: "oeste",
            condicionCielo: "despejado"
        },
        idDistrito: "D007"
    }
])

db.ReporteClima.find();

// PRONOSTICO METEOROLOGICO --------------------------------------------------
db.createCollection
(
    "PronosticoMeteorologico",
    {
        validator:
        {
            $jsonSchema:
            {
                required: ["_id","temperatura", "precipitacion", "humedad", "velocidadViento", "direccionViento", "condicionCielo", "idReportes"],
                properties:
                {
                    _id:
                    {
                        bsonType:"string",
                        description:"debe de ingresar el id del pronostico meteorologico"
                    },
                    temperatura:
                    {
                        bsonType:"double",
                        minimum: -89.99,
                        maximum: 51.99,
                        description:"debe de ingresar la temperatura en el rango [-89, 51]"
                    },
                    precipitacion:
                    {
                        bsonType:"double",
                        minimum: 0.01,
                        maximum: 30.01,
                        description:"debe de ingresar la precipitacion en el rango [0, 30]"
                    },
                    humedad:
                    {
                        bsonType:"double",
                        minimum: 0.01,
                        maximum: 100.01,
                        description:"debe de ingresar la humedad en el rango [0, 100]"
                    },
                    velocidadViento:
                    {
                        bsonType:"double",
                        minimum: 20.01,
                        maximum: 61.1,
                        description:"debe de ingresar la velocidad del viento en el rango [20, 61]"
                    },
                    direccionViento:
                    {
                        bsonType:"string",
                        enum: ["este", "oeste", "norte", "sur"],
                        description:"debe de ingresar la direccion del viento"
                    },
                    condicionCielo:
                    {
                        bsonType:"string",
                        enum: ["despejado", "cubierto de nubes", "probabilidad de precipitaciones"],
                        description:"debe de ingresar la condicion del cielo"
                    },
                    idReportes:
                    {
                        bsonType:"array",
                        description:"debe de ingresar el id del reporte en que se baso el pronostico"
                    }
                }
            }
        }
    }
);

db.PronosticoMeteorologico.insertMany([
    {
        _id: "PM001",
        temperatura: -5.60, //89-51 °C
        precipitacion: 20.10, // 0-30 mm/h
        humedad: 40.20, // 0-100%
        velocidadViento: 30.30, //20-61 km
        direccionViento: "norte",
        condicionCielo: "probabilidad de precipitaciones",
        idReportes: ["RC001","RC003"]
    },
    {
        _id: "PM002",
        temperatura: 20.80, //°C
        precipitacion: 1.10, // 0-30 mm/h
        humedad: 5.20, // 0-100%
        velocidadViento: 27.90, //20-61 km
        direccionViento: "sur",
        condicionCielo: "despejado",
        idReportes: ["RC002","RC004"]
    },
    {
        _id: "PM003",
        temperatura: 17.80,
        precipitacion: 24.60,
        humedad: 60.80,
        direccionViento: "norte",
        velocidadViento: 25.30,
        condicionCielo: "cubierto de nubes",
        idReportes: ["RC001"]
    },
    {
        _id: "PM004",
        temperatura: 7.70,
        precipitacion: 29.05,
        humedad: 30.90,
        velocidadViento: 21.1,
        direccionViento: "sur",
        condicionCielo: "probabilidad de precipitaciones",
        idReportes: ["RC004"]
    },
    {
        _id: "PM005",
        temperatura: 15.80,
        precipitacion: 22.10,
        humedad: 50.50,
        velocidadViento: 21.30,
        direccionViento: "sur",
        condicionCielo: "cubierto de nubes",
        idReportes: ["RC005"]
    },
    {
       _id: "PM006",
       temperatura: 18.90,
       precipitacion: 13.70,
       humedad: 50.55,
       velocidadViento: 25.34,
       direccionViento: "este",
       condicionCielo: "cubierto de nubes",
       idReportes: ["RC006"]
   },
   {
       _id: "PM007",
       temperatura: 23.3,
       precipitacion: 25.3,
       humedad: 82.4,
       velocidadViento: 52.2,
       direccionViento: "oeste",
       condicionCielo: "despejado",
       idReportes: ["RC007"]
  }
])

db.PronosticoMeteorologico.find();

//TIPO DE EVENTO --------------------------------------------------
db.createCollection
(
    "TipoEvento",
    {
        validator:
            {
                $jsonSchema:
                {
                required: ["descripcion"],
                properties:
                    {
                    descripcion: {
                        bsonType: "string",
                        description : "Se debe ingresar una descripcion como transcurrio el Tipo de evento o como se espera transcurra"
                    }
                    }
                }
            }
    }
)


db.TipoEvento.insertMany([
    {
         _id: "TE001",
         descripcion: "Tormenta"
    },
    {
        _id:"TE002",
        descripcion: "Lluvia Torrencial"
    },
    {
        _id:"TE003",
            descripcion: "Inundacion"
    },
    {
       _id:"TE004",
           descripcion: "Huaico"
    },
    {
        _id:"TE005",
            descripcion: "Granizo"
    }
])

db.TipoEvento.find();

//METODO PREVENCION DE DANIO --------------------------------------------------
db.getCollection("MetodoPrevencionDanio").drop();
db.createCollection
(
    "MetodoPrevencionDanio",
    {
        validator:
            {
                $jsonSchema:
                {
                required: ["descripcion", "idTipo"],
                properties:
                    {
                    descripcion: {
                        bsonType: "string",
                        description : "Se debe ingresar una descripcion de que como manejar el evento para evitar todo tipo de daño"
                    },

                    idTipo: {
                        bsonType: "string",
                        description : "se debe ingresar el id del tipo de evento al que pertenece este metodo de prevencion de daño"
                    },
                    }
                }
            }
    }
)


db.MetodoPrevencionDanio.insertMany([
    {
         _id: "MD001",
         descripcion: "Al salir con coches usar llantas para lluvia, al salir a la calle salgan abrigados y con un paraguas",
         idTipo: "TE001",
    },
    {
        _id: "MD002",
        descripcion:"Poner baldes por donde entre el agua hara que el piso no se inunde",
        idTipo:"TE002"
    },
    {
        _id: "MD003",
        descripcion:"Mover a un lugar alto los elementos de mas valor y alejarse de postes de electricidad",
        idTipo:"TE003"
    },
    {
       _id: "MD004",
       descripcion:"Mantenerse en lugares altos mientras acaba el huaico",
       idTipo:"TE004"
    },
    {
        _id: "MD005",
        descripcion:"Evitar salir a la calle si esta granizando",
        idTipo:"TE005"
    }
])

db.MetodoPrevencionDanio.find();

// EVENTO CLIMATICO --------------------------------------------------
db.createCollection
(
    "EventoClimatico",
    {
        validator:
            {
                $jsonSchema:
                {
                required: ["idTipo" , "idDistrito", "grado", "descripcion", "eventovenidero"],
                properties:
                    {
                    idTipo: {
                        bsonType: "string",
                        description : "se debe ingresar el id de Tipo al que pertenece este evento climatico"
                    },

                    idDistrito: {
                        bsonType: "string",
                        description : "se debe ingresar el id del distrito al que pertenece este evento climatico"
                    },

                    grado: {
                        bsonType: "string",
                        description : " Se debe Indica el grado de peligro del evento, desde leve (L), medio (M), alto (A) , hasta extremo (E)"
                    },

                    descripcion: {
                        bsonType: "string",
                        description : " Se debe ingresar una descripcion como transcurrio el evento o como se espera transcurra "
                    },

                    eventovenidero: {
                        bsonType: "bool",
                        description : " Se debe ingresar si el evento a sucedido o no, siendo True si ha pasado y False si va a suceder"
                    },
                    }
                }
            }
    }
)


db.EventoClimatico.insertMany([
    {
        _id: "EV001",
        idDistrito: "D001",
        idTipo: "TE001",
        grado: "A",
        descripcion: "Tormenta fuerte que comenzara a las 6pm aproximadamente afectando a toda la zona de Selva Media, Amazonas",
        eventovenidero: true
    },
    {
       _id:"EV002",
       idDistrito: "D002",
       idTipo:"TE002",
       grado:"M",
       descripcion: "Lluvias Fuertes sobre Lima",
       eventovenidero: false
    },
    {
       _id:"EV003",
       idDistrito: "D004",
       idTipo:"TE003",
       grado:"M",
       descripcion: "Inundacion sobre Belen, Iquitos",
       eventovenidero: true
    },
    {
      _id:"EV004",
      idDistrito: "D006",
      idTipo:"TE004",
      grado:"A",
      descripcion: "Huaico sobre Puquio, Ayacucho",
      eventovenidero: true
    },
    {
       _id:"EV005",
       idDistrito: "D009",
       idTipo:"TE005",
       grado:"M",
       descripcion: "Fuerte lluvia por el distrito de Huata",
       eventovenidero: true
    }
]);

db.EventoClimatico.find();

// ALERTA --------------------------------------------------
db.createCollection
(
    "Alerta",
    {
        validator:
        {
            $jsonSchema:
            {
                required:["tipoAlerta", "fechaInicio", "fechaPosibleFin", "hora", "estado"],
                properties:
                {
                    tipoAlerta:
                    {
                        bsonType: "string",
                        enum: ["V", "A", "R"],
                        description: "Se debe ingresar el tipo de alerta (V-Verde: posible impacto, A-Amarillo: el usuario debe estar preparado para el evento, R-Roja: el usuario se encuentra en una zona con mayor peligro)"
                    },
                    fechaInicio:
                    {
                        bsonType: "string",
                        description: "Se debe ingresar la fecha cuando se crear la alerta"
                    },
                    fechaPosibleFin:
                    {
                        bsonType: "string",
                        description: "Se debe ingresar la posible fecha fin de la alerta"
                    },
                    hora:
                    {
                        bsonType: "string",
                        description: "Se debe ingresar la hora que en que se crea la alerta"
                    },
                    estado:
                    {
                        bsonType: "string",
                        enum:["ACTIVO", "NO ACTIVO"],
                        description: "Se debe ingresar el estado de la alerta Activo o No Activo"
                    },
                }
            }
        }
    }
);

db.Alerta.insertMany([
    {
        _id: "ALT001",
        idEvento:"EV001",
        tipoAlerta: "V",
        fechaInicio: "2023-05-12",
        fechaPosibleFin: "2023-05-12",
        hora: "13:20",
        estado: "ACTIVO",
    },
    {
        _id:"ALT002",
        idEvento:"EV002",
        tipoAlerta: "V",
        fechaInicio:"2023-06-23",
        fechaPosibleFin:"2023-06-25",
        hora: "12:30",
        estado: "ACTIVO"
    },
    {
        _id:"ALT003",
        idEvento:"EV003",
        tipoAlerta: "R",
        fechaInicio:"2023-06-24",
        fechaPosibleFin:"2023-12-01",
        hora: "14:50",
        estado: "ACTIVO"
    },
    {
       _id:"ALT004",
       idEvento:"EV004",
       tipoAlerta: "A",
       fechaInicio:"2023-06-27",
       fechaPosibleFin:"2023-06-30",
       hora: "12:30",
       estado: "ACTIVO"
   },
   {
       _id:"ALT005",
       idEvento:"EV004",
       tipoAlerta: "A",
       fechaInicio:"2023-06-26",
       fechaPosibleFin:"2023-06-27",
       hora: "08:00",
           estado: "NO ACTIVO"
   }
]);

db.Alerta.find();

//NOTIFICACION --------------------------------------------------
db.createCollection
(
    "Notificacion",
    {
        validator:
        {
            $jsonSchema:
            {
                required:["idAlerta", "fecha", "hora", "contenido", "estado"],
                properties:
                {
                    idAlerta:
                    {
                        bsonType: "string",
                        description: "Se debe ingresar el id de la alerta"
                    },
                    fecha:
                    {
                        bsonType: "string",
                        description: "Se debe ingresar la fecha en que se envia la notificacion "
                    },
                    hora:
                    {
                        bsonType: "string",
                        description: "Se debe ingresar la hora en que se envia la notificacion"
                    },
                    contenido:
                    {
                         bsonType: "object",        //contenido de la notificacion
                         required: ["tipoAlerta", "fechaInicio", "fechaPosibleFin", "hora", "estado"],
                         properties:
                         {
                            tipoAlerta:
                            {
                                bsonType: "string",
                                enum: ["V","A","R"],
                                description: "Se debe ingresar el tipo de alerta (V-Verde: posible impacto, A-Amarillo: el usuario debe estar preparado para el evento, R-Roja: el usuario se encuentra en una zona con mayor peligro)"
                            },
                            fechaInicio:
                            {
                                bsonType: "string",
                                description: "Se debe ingresar la fecha cuando se crear la alerta"
                            },
                            fechaPosibleFin:
                            {
                                bsonType: "string",
                                description: "Se debe ingresar la posible fecha fin de la alerta"
                            },
                            hora:
                            {
                                bsonType: "string",
                                description: "Se debe ingresar la hora que en que se crea la alerta"
                            },
                            estado:
                            {
                                bsonType: "string",
                                enum:["ACTIVO", "NO ACTIVO"],
                                description: "Se debe ingresar el estado de la alerta Activo o No Activo"
                            },
                         }
                    },
                    estado:
                    {
                        bsonType: "string",
                        enum: ["LEIDO", "NO LEIDO"],
                        description: "Se debe ingresar el estado de la notificacion LEIDO O NO LEIDO"
                    },
                }
            }
        }
    }
);

db.Notificacion.insertMany([
    {
         _id: "NOT001",
         idAlerta: "ALT001",
         fecha: "2023-06-13",
         hora: "19:17",
         contenido:
         {
             tipoAlerta: "V",
             fechaInicio: "2023-05-12",
             fechaPosibleFin: "2023-05-12",
             hora: "13:20",
             estado: "ACTIVO",
         },
         estado: "LEIDO",
    },
    {
        _id: "NOT002",
         idAlerta:"ALT002",
         fecha:"2023-06-23",
         hora:"12:35",
         contenido:
         {
            tipoAlerta: "V",
            fechaInicio: "2023-06-23",
            fechaPosibleFin: "2023-06-25",
            hora: "12:30",
            estado: "ACTIVO"
         },
         estado: "LEIDO"
    },
    {
        _id: "NOT003",
         idAlerta:"ALT003",
         fecha:"2023-06-24",
         hora:"12:40",
         contenido:
         {
            tipoAlerta: "R",
            fechaInicio: "2023-06-24",
            fechaPosibleFin: "2023-12-01",
            hora: "12:40",
            estado: "ACTIVO"
         },
         estado: "NO LEIDO"
    },
    {
        _id: "NOT004",
         idAlerta:"ALT004",
         fecha:"2023-06-27",
         hora:"16:30",
         contenido:
         {
            tipoAlerta: "A",
            fechaInicio: "2023-06-27",
            fechaPosibleFin: "2023-06-30",
            hora: "12:30",
            estado: "ACTIVO"
         },
         estado: "LEIDO"
    },
    {
        _id: "NOT005",
         idAlerta:"ALT005",
         fecha:"2023-06-23",
         hora:"12:30",
         contenido:
         {
            tipoAlerta: "A",
            fechaInicio: "2023-07-01",
            fechaPosibleFin: "2023-06-01",
            hora: "14:40",
            estado: "ACTIVO"
         },
         estado: "LEIDO"
    }

]);

db.Notificacion.find();

// USUARIO --------------------------------------------------
db.createCollection
(
    "usuario",
    {
        validator:
        {
           $jsonSchema:
           {
                required: ["nombre", "apellidoPaterno", "apellidoMaterno","tipoDocumento","nroDocumento","correo", "membresia"],
                properties:
                {
                    nombre:
                    {
                        bsonType:"string",
                        description:"Debe ingresar un nombre"
                    },
                    apellidoPaterno:
                    {
                        bsonType:"string",
                        description:"Debe ingresar un apellido paterno"
                    },
                    apellidoMaterno:
                    {
                        bsonType:"string",
                        description:"Debe ingresar un apellido materno"
                    },
                    tipoDocumento:
                    {
                        enum:["DNI","CARNET","RUC"],
                        description:"El tipo de documento solo debe ser DNI, CARNET O RUC"
                    },
                    nroDocumento:
                    {
                        bsonType:"int",
                        description:"Debe de ingresar un numero de documento"
                    },
                    correo:
                    {
                        bsonType:"string",
                        description:"Debe de ingresar un correo"
                    },
                    membresia:
                    {
                        bsonType: "bool",
                        description: "Debe de ingresar True si tiene membresia o False si no cuenta con membresia"
                    }
                }
           }
        },
        validationAction:"error"
    }
);

db.usuario.insertMany([
  {
    _id: "US001",
    nombre: "John",
    apellidoPaterno: "Doe",
    apellidoMaterno: "Smith",
    tipoDocumento: "DNI",
    nroDocumento: 12345678,
    telefonoFijo: "1234567",
    telefonoMovil: "987654321",
    correo: "john.doe@example.com",
    fechaNacimiento: new Date("1990-01-01"),
    membresia: true,
    idDistrito: "D001",
    idNotificacion: "D001"
  },
  {
    _id: "US002",
    nombre: "Jane",
    apellidoPaterno: "Smith",
    apellidoMaterno: "Doe",
    tipoDocumento: "DNI",
    nroDocumento: 87654321,
    telefonoFijo: "7654321",
    telefonoMovil: "123456789",
    correo: "jane.smith@example.com",
    fechaNacimiento: new Date("1992-05-15"),
    membresia: true,
    idDistrito: "D003",
    idNotificacion: "D002"
  },
  {
    _id: "US003",
    nombre: "Michael",
    apellidoPaterno: "Johnson",
    apellidoMaterno: "Williams",
    tipoDocumento: "DNI",
    nroDocumento: 56789123,
    telefonoFijo: "9876543",
    telefonoMovil: "456789123",
    correo: "michael.johnson@example.com",
    fechaNacimiento: new Date("1985-09-10"),
    membresia: true,
    idDistrito: "D003",
    idNotificacion: "D003"
  },
  {
    _id: "US004",
    nombre: "Emily",
    apellidoPaterno: "Brown",
    apellidoMaterno: "Davis",
    tipoDocumento: "DNI",
    nroDocumento: 98765432,
    telefonoFijo: "8765432",
    telefonoMovil: "789123456",
    correo: "emily.brown@example.com",
    fechaNacimiento: new Date("1998-03-25"),
    membresia: false,
    idDistrito: "D002",
    idNotificacion: "D004"
  },
  {
    _id: "US005",
    nombre: "Daniel",
    apellidoPaterno: "Wilson",
    apellidoMaterno: "Taylor",
    tipoDocumento: "DNI",
    nroDocumento: 54321678,
    telefonoFijo: "6543216",
    telefonoMovil: "321654987",
    correo: "daniel.wilson@example.com",
    fechaNacimiento: new Date("1994-07-12"),
    membresia: true,
    idDistrito: "D004",
    idNotificacion: "D005"
  }
]);

db.usuario.find()

// TARIFARIO --------------------------------------------------
db.createCollection
(
  "Tarifario",
  {
    validator:
    {
      $jsonSchema :
      {
        required: ["Precio", "nombrePlan", "duracionMes"],
        properties:
        {
            Precio: {
              bsonType: "double",
              description: "se debe ingresar el precio que viene como tarifa"
            },

            nombrePlan: {
              bsonType: "string",
              description : "se debe ingresar el el nombre del plan al que pertenece este tarifario"
            },

            duracionMes: {
               bsonType: "int",
               description: "se debe ingresar por cuantos meses dura el plan"
            }

        }
      }
    }
  }
)

db.Tarifario.insertMany([
  {
     _id: "Tf001",
     Precio: 28.90,
     duracionMes: 6,
     nombrePlan: "Semestral",
  },
  {
    _id: "Tf002",
    Precio: 15.40,
    duracionMes: 3,
    nombrePlan: "Trimestral"
  },
  {
    _id: "Tf003",
    Precio: 6.70,
    duracionMes: 1,
    nombrePlan: "Mensual"
  },
  {
   _id: "Tf004",
   Precio: 48.9,
   duracionMes: 12,
   nombrePlan: "Anual"
  }
])

db.Tarifario.find()

// METODO DE PAGO --------------------------------------------------
db.createCollection
(
  "MetodoPago",
  {
    validator:
    {
      $jsonSchema :
      {
        required: ["tipo", "credencialTarjeta", "fechaVencimiento", "codSeguridad", "idUsuario"],
        properties:
        {
            tipo: {
              bsonType: "string",
              description: "se debe ingresar el tipo de tarjeta que se estan ingresando"
            },
            credencialTarjeta: {
              bsonType: "int",
              description : "se debe ingresar el numero de tarjeta"
            },
            fechaVencimiento: {
               bsonType: "string",
               description: "se debe ingresar la fecha de vencimiento de la tarjeta a ingresar"
            },
            codSeguridad: {
               bsonType: "string",
               description: "se debe ingresar el codigo de seguridad de 3 digitos de la tarjeta"
            },
            idUsario: {
               bsonType: "string",
               description: "se debe ingresar el id del usuario al que pertenece este metodo de pago"
            }
        }
      }
    }
  }
)

db.MetodoPago.insertMany([
  {
    _id: "MP001",
    tipo : "Tarjeta de credito",
    credencialTarjeta: 736583182,
    fechaVencimiento: "2004-04-10",
    codSeguridad: "342",
    idUsuario: "US001"

  },
  {
    _id: "MP002",
    codSeguridad: "431",
    credencialTarjeta: 723649875,
    tipo:"Tarjeta de credito",
    fechaVencimiento:"2027-04-01",
    idUsuario: "US002"
  },
  {
    _id: "MP003",
    codSeguridad: "521",
    credencialTarjeta: 72312345,
    tipo:"Tarjeta de debito",
    fechaVencimiento:"2028-03-11",
    idUsuario: "US003"
  },
  {
   _id: "MP004",
   codSeguridad: "897",
   credencialTarjeta: 45575487,
   tipo:"Tarjeta de credito",
   fechaVencimiento:"2029-07-03",
   idUsuario: "US004"
  },
  {
     _id: "MP005",
     codSeguridad: "641",
     credencialTarjeta: 45586920,
     tipo:"Tarjeta de debito",
     fechaVencimiento:"2026-11-02",
     idUsuario: "US005"
  }
])

db.MetodoPago.find()

// COMPROBANTE DE PAGO --------------------------------------------------
db.getCollection("Comprobante_Pago").drop();
db.createCollection
(
  "Comprobante_Pago",
  {
    validator:
    {
      $jsonSchema :
      {
        required: ["idMetodoPago", "idTarifario", "fechaEmision"],
        properties:
        {
            idMetodoPago: {
              bsonType: "string",
              description: "se debe ingresar el id del metodo de pago relacionado al comprobante"
            },

            idTarifario: {
              bsonType: "string",
              description : "se debe ingresar el id del tarifario del que salen los precios"
            },

            fechaEmision: {
               bsonType: "string",
               description: "se debe ingresar la fecha de emision del comprobante"
            }

        }
      }
    }
  }
)

db.Comprobante_Pago.insertMany([
  {
     _id: "CdP001",
     idMetodoPago: "MP001",
     idTarifario: "Tf001",
     fechaEmision: "2004-04-10"
  },
  {
     _id:"CdP002",
     fechaEmision: "2023-06-22",
     idMetodoPago:"MP002",
     idTarifario:"Tf002"
  },
  {
     _id:"CdP003",
     fechaEmision: "2023-07-01",
     idMetodoPago:"MP003",
     idTarifario:"Tf003"
  },
  {
    _id:"CdP004",
    fechaEmision: "2023-07-01",
    idMetodoPago:"MP004",
    idTarifario:"Tf004"
  },
  {
    _id:"CdP005",
    fechaEmision: "2023-07-25",
    idMetodoPago:"MP005",
    idTarifario:"Tf003"
  }
])

db.Comprobante_Pago.find()

// AGREGATES ----------------------------------------------------

// Mostrar las notificaciones que han sido leidas
db.Notificacion.aggregate
(
    [
        {
            $match:
            {
                estado: "LEIDO",
            }
        }
    ]
);


// Mostrar la cantidad de eventos climaticos por distrito
db.EventoClimatico.aggregate
(
    [
        {
            $group:
            {
                _id: "$idDistrito", Cantidad_EventosClimaticos: { $sum: 1}

            }
        }
    ]
);


// Obtener el promedio de precipitación por mes para todos los reportes climáticos.
db.ReporteClima.aggregate([
  {
    $group: {
      _id: { $month: "$fecha" },
      promedioPrecipitacion: { $avg: "$precipitacion" }
    }
  },
  {
    $project: {
      _id: 0,
      mes: "$_id",
      promedioPrecipitacion: 1
    }
  },
  {
    $sort: { mes: 1 }
  }
]);

// Obtener el número de eventos climáticos por tipo de evento.
db.EventoClimatico.aggregate([
  {
    $group: {
      _id: "$idTipo",
      tipoEvento: { $first: "$idTipo" },
      cantidadEventos: { $sum: 1 }
    }
  },
  {
    $lookup: {
      from: "TipoEvento",
      localField: "tipoEvento",
      foreignField: "idTipo",
      as: "tipo"
    }
  },
  {
    $project: {
      _id: 0,
      tipo: { $arrayElemAt: ["$tipo.descripcion", 0] },
      cantidadEventos: 1
    }
  }
]);


//mostrar los usuarios que no tengan membresías
db.usuario.aggregate(
[
    {
        $match:{
            membresia: "false"
        }
    }
]
)

//mostrar los tarifarios de membresías cuya duración sea 3 meses
db.Tarifario.aggregate
(
  [
      {
         $match: {
            duracionMes: 3
         }
      }
  ]
)


//Obtener los detalles del eventos climático cuando el evento venidero sea true
db.EventoClimatico.aggregate
(
  [
      {
         $match: {
            eventovenidero: true
         }
      }
  ]
)

//Obtener los distritos en los que vive el usuario, además de mostrar su información esencial
db.usuario.aggregate([
  {
    $lookup: {
      from: "distrito",
      localField: "idDistrito",
      foreignField: "_id",
      as: "distrito"
    }
  },
  {
    $project: {
      _id: 1,
      NombreCompleto: { $concat: ["$nombre", " ", "$apellidoPaterno", " ", "$apellidoMaterno"] },
      tipoDocumento: 1,
      nroDocumento: 1,
      distrito: 1
    }
  }
])


// Mostrar cuando el id tipo de evento climatico es TY001
db.EventoClimatico.aggregate
(
    [
       {
         $match:
         {
            idTipo: "TY001"
         }
       }
    ]
)

// Añadir al apartado de distrito una casilla mostrando la provincia a la que pertenece 
db.Alerta.aggregate
(
    [
       {
         $match:
         {
            estado: "ACTIVO"
         }
       },
       {
         $project: {
         _id: 1,
         estado: 1,
         fechaInicio: 1,
         hora: 1,
         tipoAlerta : 1
         }
       }
    ]
)
