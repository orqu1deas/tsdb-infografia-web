# TSDB - Infografía Web + Simulación

Este proyecto fue desarrollado para la materia de **Análisis de Ciencia de Datos**, en la que se nos encargó crear un recurso gráfico (infografía o sitio interactivo), acompañado de un video explicativo, con el objetivo de enseñarle a nuestros compañeros sobre distintos tipos de bases de datos. A nuestro equipo nos tocó el tema de las **Time-Series Databases (TSDB)**.

> “The TSDB has grown in popularity in recent years, and last year it was the fastest-growing type of database in the enterprise, largely because of the growing number of use cases for it.”
> — *Peter Wayner, Database Trends: The rise of the time-series database*, January 15, 2021

---

## ¿Qué contiene este repositorio?

- Un **sitio web interactivo tipo infografía**, donde explicamos de manera visual y sencilla qué son las TSDB y cómo se usan.
- Una pequeña **simulación de dashboard** construida con **R y Shiny**, que representa cómo podría verse una TSDB en acción en la vida real.
- Todos los recursos fueron pensados tanto para **enseñar** como para **practicar habilidades de desarrollo web** (HTML, CSS) y **visualización de datos** en R.

---

## Sobre la simulación en R

Aunque no se utilizó un software de TSDB como tal (ej. InfluxDB, TimescaleDB), decidimos simular cómo luce un conjunto de datos tipo TSDB usando información real del tipo de cambio **USD/MXN**.

> Datos obtenidos de:  
> [Investing.com - USD/MXN Historical Data](https://mx.investing.com/currencies/usd-mxn-historical-data)

Creamos un dashboard minimalista en Shiny que permite:
- Filtrar el rango de fechas
- Visualizar el comportamiento del tipo de cambio
- Calcular estadísticas básicas (promedio, máximo, mínimo)

Esto sirvió también como una forma de **repasar conceptos** y **practicar R para dashboards**.

---

## Créditos ✨

- Desarrollado por [Equipo 9]
- Proyecto académico - Ingeniería en Ciencia de Datos y Matemáticas
