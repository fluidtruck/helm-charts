{{/*
Return the proper NextJS image name
*/}}
{{- define "cronjob.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "cronjob.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image)) -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "cronjob.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}\
{{- end -}}

{{/*
Print "true" the wait-for-postgresql should be used.
Usage:
{{ include "cronjob.waitForPostgresql" . }}
*/}}
{{- define "cronjob.waitForPostgresql" -}}
{{- if and (eq .Values.postgresql.enabled true) (eq .Values.postgresql.wait true) (.Values.postgresql.postgresqlPassword) -}}
{{- print "true" -}}
{{- else -}}
{{- print "false" -}}
{{- end -}}
{{- end -}}

{{/*
Print hostname for the postgresql service.
Usage:
{{ include "cronjob.postgresqlHost" . }}
*/}}
{{- define "cronjob.postgresqlHost" -}}
{{- printf "%s-postgresql.%s.svc.cluster.local" .Release.Name .Release.Namespace | quote -}}
{{- end -}}

{{/*
Print "true" the wait-for-redis should be used.
Usage:
{{ include "cronjob.waitForRedis" . }}
*/}}
{{- define "cronjob.waitForRedis" -}}
{{- if and (eq .Values.redis.enabled true) (eq .Values.redis.wait true) (.Values.redis.password) -}}
{{- print "true" -}}
{{- else -}}
{{- print "false" -}}
{{- end -}}
{{- end -}}

{{/*
Print hostname for the redis service.
Usage:
{{ include "cronjob.redisHost" . }}
*/}}
{{- define "cronjob.redisHost" -}}
{{- printf "%s-redis-master.%s.svc.cluster.local" .Release.Name .Release.Namespace | quote -}}
{{- end -}}
