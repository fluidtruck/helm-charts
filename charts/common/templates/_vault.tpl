{{/* vim: set filetype=mustache: */}}

{{- define "common.vault.role" -}}
{{- if eq .vault.auth.service "" -}}
{{- printf "%s-%s-%s" .vault.auth.department .vault.auth.team .env -}}
{{- else -}}
{{- printf "%s-%s-%s-%s" .vault.auth.department .vault.auth.team .vault.auth.service .env -}}
{{- end -}}
{{- end -}}

{{- define "common.vault.path" -}}
{{- if eq .vault.auth.service "" -}}
{{- printf "%s/%s/%s" .vault.auth.department .vault.auth.team .name -}}
{{- else -}}
{{- printf "%s/%s/%s/%s" .vault.auth.department .vault.auth.team .vault.auth.service .name -}}
{{- end -}}
{{- end -}}
