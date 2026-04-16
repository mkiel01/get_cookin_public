{{- define "get-cookin.name" -}}
get-cookin
{{- end }}

{{- define "get-cookin.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}

{{- define "get-cookin.labels" -}}
helm.sh/chart: {{ include "get-cookin.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ include "get-cookin.name" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end }}

{{- define "get-cookin.secretName" -}}
{{- default "get-cookin-secrets" .Values.secrets.name }}
{{- end }}
