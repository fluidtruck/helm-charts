{{/*
Return the proper image name
*/}}
{{- define "probot.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "probot.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image)) -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "probot.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}
