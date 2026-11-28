#!/usr/bin/env bash
set -euo pipefail

echo "Iniciando auditoría de seguridad"

# Detección de secretos expuestos
echo "Ejecutando Gitleaks..."
gitleaks dir . --redact --exit-code 1

# Detección de vulnerabilidades críticas
echo "Ejecutando Trivy..."
trivy fs --severity CRITICAL --exit-code 1 .

echo "Auditoría de seguridad aprobada"
