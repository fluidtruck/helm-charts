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
Kubernetes fluidtruck labels
*/}}
{{- define "common.labels.fluidtruck" -}}
fluidtruck.io/app: {{ .Values.fluidtruck.labels.app }}
fluidtruck.io/team: {{ .Values.fluidtruck.labels.team }}
fluidtruck.io/env: {{ .Values.fluidtruck.labels.env }}
{{- end -}}

{{/*
Kubernetes github labels
*/}}
{{- define "common.labels.github" -}}
github.com/pull-request-number: {{ .Values.github.labels.prnumber }}
github.com/repository: {{ .Values.github.labels.repo }}
{{- end -}}

{{/*
Labels to use on deploy.spec.selector.matchLabels and svc.spec.selector
*/}}
{{- define "common.labels.matchLabels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
