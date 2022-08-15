{{/*
Return the proper image name
*/}}
{{- define "golang.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image) -}}
{{- end -}}

{{/*
Return the service account name
*/}}
{{- define "golang.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{- default (include "common.names.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
  {{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "golang.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image)) -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "golang.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}

{{/*
Print "true" the wait-for-postgresql should be used.
Usage:
{{ include "golang.waitForPostgresql" . }}
*/}}
{{- define "golang.waitForPostgresql" -}}
{{- if and (eq .Values.postgresql.enabled true) (eq .Values.postgresql.wait true) (.Values.postgresql.auth.password) -}}
{{- print "true" -}}
{{- else -}}
{{- print "false" -}}
{{- end -}}
{{- end -}}

{{/*
Print hostname for the postgresql service.
Usage:
{{ include "golang.postgresqlHost" . }}
*/}}
{{- define "golang.postgresqlHost" -}}
{{- printf "%s-postgresql.%s.svc.cluster.local" .Release.Name .Release.Namespace -}}
{{- end -}}

{{/*
Print "true" the wait-for-redis should be used.
Usage:
{{ include "golang.waitForRedis" . }}
*/}}
{{- define "golang.waitForRedis" -}}
{{- if and (eq .Values.redis.enabled true) (eq .Values.redis.wait true) -}}
{{- print "true" -}}
{{- else -}}
{{- print "false" -}}
{{- end -}}
{{- end -}}

{{/*
Print hostname for the redis service.
Usage:
{{ include "golang.redisHost" . }}
*/}}
{{- define "golang.redisHost" -}}
{{- printf "%s-redis-master.%s.svc.cluster.local" .Release.Name .Release.Namespace -}}
{{- end -}}

{{/*
Print root hostname to be used for the ingress and TLS certificate.
Usage:
{{ include "golang.ingressRootHostname" . }}
*/}}
{{- define "golang.ingressRootHostname" -}}
{{- .Values.ingress.domain -}}
{{- end -}}

{{/*
Print FQDN hostname to be used for the ingress.
Usage:
{{ include "golang.ingressHostname" . }}
*/}}
{{- define "golang.ingressHostname" -}}
{{- if .Values.ingress.devMode -}}
{{- printf "%s.%s" .Release.Name (include "golang.ingressRootHostname" .) -}}
{{- else -}}
{{- include "golang.ingressRootHostname" . -}}
{{- end }}
{{- end -}}

{{/*
Print the liveness port name.
Usage:
{{ include "golang.livenessProbePort" . }}
*/}}
{{- define "golang.livenessProbePort" -}}
{{- if .Values.livenessProbe.port -}}
{{ .Values.livenessProbe.port }}
{{- else if eq (toString .Values.healthPort) (toString .Values.applicationPort) -}}
http
{{- else -}}
health
{{- end }}
{{- end -}}

{{/*
Print the readiness port name.
Usage:
{{ include "golang.livenessProbePort" . }}
*/}}
{{- define "golang.readinessProbePort" -}}
{{- if .Values.readinessProbe.port -}}
{{ .Values.readinessProbe.port }}
{{- else if eq (toString .Values.healthPort) (toString .Values.applicationPort) -}}
http
{{- else -}}
health
{{- end }}
{{- end -}}
