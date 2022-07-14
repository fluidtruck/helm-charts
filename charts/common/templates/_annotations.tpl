{{/* vim: set filetype=mustache: */}}
{{/*
Kubernetes GitHub annotations
*/}}
{{- define "common.annotations.github" -}}
github.com/repository-url: {{ .Values.github.repo.url }}
{{ if .Values.github.pr.number }}
github.com/pull-request-url: {{ .Values.github.pr.url }}
github.com/pull-request-owner: {{ .Values.github.pr.owner }}
github.com/pull-request-branch: {{ .Values.github.pr.branch }}
{{ else if .Values.github.release.url }}
github.com/release-url: {{ .Values.github.release.url }}
{{- end -}}
{{- end -}}
