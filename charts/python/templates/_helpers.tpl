{{/*
Return the proper image name
*/}}
{{- define "python.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image) -}}
{{- end -}}

{{/*
Return the service account name
*/}}
{{- define "python.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{- default (include "common.names.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
  {{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "python.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image)) -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "python.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}
