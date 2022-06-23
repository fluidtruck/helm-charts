{{/* vim: set filetype=mustache: */}}
{{/*
Kubernetes github annotations
*/}}
{{- define "common.annotations.github" -}}
github.com/branch: {{ .Values.github.prbranch }}
github.com/pull-request: {{ .Values.github.prurl }}
github.com/pull-request-owner: {{ .Values.github.prowner }}
github.com/repository: {{ .Values.github.repourl }}
{{- end -}}
