{{/*
Return the proper Locust image name
*/}}
{{- define "locust.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image) -}}
{{- end -}}

{{/*
Return the lib configmap name
*/}}
{{- define "locust.configmaps.lib" -}}
{{- if eq .Values.loadtest.configmaps.lib "" -}}
{{ template "common.names.fullname" . }}-lib
{{- else -}}
{{- printf .Values.loadtest.configmaps.lib -}}
{{- end -}}
{{- end -}}

{{/*
Return the locustfile configmap name
*/}}
{{- define "locust.configmaps.locustfile" -}}
{{- if eq .Values.loadtest.configmaps.locustfile "" -}}
{{ template "common.names.fullname" . }}-locustfile
{{- else -}}
{{- printf .Values.loadtest.configmaps.locustfile -}}
{{- end -}}
{{- end -}}
