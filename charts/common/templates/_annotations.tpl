{{/* vim: set filetype=mustache: */}}
{{/*
Kubernetes GitHub annotations
*/}}
{{- define "common.annotations.github" -}}
github.com/branch: {{ .Values.github.branch }}
github.com/repository-url: {{ .Values.github.repo.url }}
{{ if .Values.pr.number }}
github.com/pull-request-url: {{ .Values.pr.url }}
github.com/pull-request-owner: {{ .Values.pr.owner }}
{{ else if .Values.release.url }}
github.com/release-url: {{ .Values.release.url }}
{{- end -}}
{{- end -}}
