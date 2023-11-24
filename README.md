# server_metrics_check

**server_metrics_check** es un script diseñado para proporcionar información valiosa sobre el uso de la CPU y la memoria en servidores Linux, especialmente pensado para su integración con NRPE (Nagios e Icinga).

## Características Principales

- **Monitoreo de CPU:** Ofrece un análisis detallado de la carga de la CPU, incluyendo información sobre el uso, la inactividad y otros parámetros críticos.

- **Monitoreo de Memoria:** Examina el uso de la memoria, proporcionando estadísticas detalladas sobre la memoria principal y la memoria swap.

## Uso

El script es altamente personalizable a través de opciones de línea de comandos. Aquí tienes algunos ejemplos:

```bash
./server_metrics_check.sh -C -w 70 -c 90 -s 5  # Verifica la CPU con umbral de advertencia 70, umbral crítico 90 y espera de 5 segundos
./server_metrics_check.sh -M -w 80,101 -c 90,101  # Verifica la memoria con umbral de advertencia 80%, umbral crítico 90%
```

## Utilidad y Beneficios

Este script es útil para:

- **Monitoreo Proactivo:** Detecta problemas potenciales de rendimiento antes de que afecten al servidor.

- **Optimización de Recursos:** Proporciona información detallada sobre el uso de CPU y memoria, permitiendo ajustes para una mejor eficiencia.

- **Resolución Rápida de Problemas:** Facilita la identificación y solución de problemas relacionados con la carga del sistema.

## Recursos Utilizados

El script se ejecuta directamente en el servidor sin necesidad de instalaciones adicionales, minimizando el impacto en los recursos del sistema.

¡Optimiza el rendimiento de tu servidor Linux de manera sencilla y efectiva con **server_metrics_check**!
