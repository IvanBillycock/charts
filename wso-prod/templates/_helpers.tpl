{{/*
Expand the name of the chart.
*/}}
{{- define "integration.name" -}}
{{- default .Chart.Name .Values.integration.apps.wso2apim.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "integration.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "integration.serviceAccountName" -}}
{{- if .Values.integration.settings.serviceAccount.enabled }}
{{- default (printf "%s-service" (include "integration.name" .)) .Values.integration.settings.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.integration.settings.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
############################################################################
                                WSO2APIM
############################################################################
*/}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wso2apim.fullname" -}}
{{- default .Chart.Name .Values.integration.apps.wso2apim.name }}
{{- end -}}

{{/*
wso2apim NAME
*/}}
{{- define "wso2apim.resource.prefix" -}}
{{- "wso2apim" }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "wso2apim.labels" -}}
helm.sh/chart: {{ include "integration.chart" . }}
{{ include "wso2apim.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wso2apim.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wso2apim.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}




{{/*
############################################################################
                                POSTGRESQL
############################################################################
*/}}

{{- define "postgresql.fullname" -}}
{{- default .Chart.Name .Values.integration.apps.postgresql.name }}
{{- end -}}

{{/*
RESOURCE PREFIX
*/}}
{{- define "postgresql.resource.prefix" -}}
{{- "postgresql" }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "postgresql.labels" -}}
helm.sh/chart: {{ include "integration.chart" . }}
{{ include "postgresql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "postgresql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postgresql.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
############################################################################
                                WSO2MI
############################################################################
*/}}

{{- define "wso2mi.fullname" -}}
{{- default .Chart.Name .Values.integration.apps.wso2mi.name }}
{{- end -}}

{{/*
RESOURCE PREFIX
*/}}
{{- define "wso2mi.resource.prefix" -}}
{{- "wso2mi" }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "wso2mi.labels" -}}
helm.sh/chart: {{ include "integration.chart" . }}
{{ include "wso2mi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wso2mi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wso2mi.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
############################################################################
                                WSO2MI-DASHBOARD
############################################################################
*/}}

{{- define "dashboard.fullname" -}}
{{- default .Chart.Name .Values.integration.apps.dashboard.name }}
{{- end -}}

{{/*
RESOURCE PREFIX
*/}}
{{- define "dashboard.resource.prefix" -}}
{{- "dashboard" }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "dashboard.labels" -}}
helm.sh/chart: {{ include "integration.chart" . }}
{{ include "dashboard.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "dashboard.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dashboard.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


