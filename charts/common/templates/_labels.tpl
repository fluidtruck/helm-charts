{{/* vim: set filetype=mustache: */}}
{{/*
Kubernetes standard labels
*/}}
{{- define "common.labels.standard" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
helm.sh/chart: {{ include "common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Kubernetes FluidTruck labels
*/}}
{{- define "common.labels.fluidtruck" -}}
fluidtruck.io/app: {{ .Values.fluidtruck.app }}
fluidtruck.io/team: {{ .Values.fluidtruck.team }}
fluidtruck.io/env: {{ .Values.fluidtruck.env }}
{{- end -}}

{{/*
Kubernetes GitHub labels
*/}}
{{- define "common.labels.github" -}}
github.com/repository: {{ .Values.github.repo.name }}
{{ if .Values.github.pr.number }}
github.com/pull-request: {{ .Values.github.pr.number | toString | quote }}
{{ else if .Values.github.release.version }}
github.com/release: {{ .Values.github.release.version | toString | quote }}
{{- end -}}
{{- end -}}

{{/*
Labels to use on deploy.spec.selector.matchLabels and svc.spec.selector
*/}}
{{- define "common.labels.matchLabels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
