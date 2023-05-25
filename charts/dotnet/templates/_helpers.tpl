{{/*
Return the proper image name
*/}}
{{- define "dotnet.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image) -}}
{{- end -}}

{{/*
Return the service account name
*/}}
{{- define "dotnet.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{- default (include "common.names.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
  {{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "dotnet.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image)) -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "dotnet.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}

{{/*
Print "true" the wait-for-redis should be used.
Usage:
{{ include "dotnet.waitForRedis" . }}
*/}}
{{- define "dotnet.waitForRedis" -}}
{{- if and (eq .Values.redis.enabled true) (eq .Values.redis.wait true) -}}
{{- print "true" -}}
{{- else -}}
{{- print "false" -}}
{{- end -}}
{{- end -}}

{{/*
Print hostname for the redis service.
Usage:
{{ include "dotnet.redisHost" . }}
*/}}
{{- define "dotnet.redisHost" -}}
{{- printf "%s-redis-master.%s.svc.cluster.local" .Release.Name .Release.Namespace -}}
{{- end -}}

{{/*
Print root hostname to be used for the ingress and TLS certificate.
Usage:
{{ include "dotnet.ingressRootHostname" . }}
*/}}
{{- define "dotnet.ingressRootHostname" -}}
{{- .Values.ingress.domain -}}
{{- end -}}

{{/*
Print FQDN hostname to be used for the ingress.
Usage:
{{ include "dotnet.ingressHostname" . }}
*/}}
{{- define "dotnet.ingressHostname" -}}
{{- if .Values.ingress.devMode -}}
{{- printf "%s.%s" .Release.Name (include "dotnet.ingressRootHostname" .) -}}
{{- else -}}
{{- include "dotnet.ingressRootHostname" . -}}
{{- end }}
{{- end -}}
