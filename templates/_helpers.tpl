{{/*
Default Template for Deployment. All Sub-Charts under this Chart can include the below template.
*/}}
{{- define "parent-chart.deploymenttemplate" }}
apiVersion: {{ .Values.kubeApiVersion }}
kind: Deployment
metadata:
  name: {{ .Values.appName  }}
spec:
  replicas: {{ .Values.replicaCount  }}
  selector:
    matchLabels:
      app: {{ .Values.appName  }}
  template:
    metadata:
      labels:
        app: {{ .Values.appName  }}
{{- end }}


{{/*
Default Template for Service. All Sub-Charts under this Chart can include the below template.
*/}}
{{- define "parent-chart.servicetemplate" }}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.appName }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      protocol: TCP
  selector:
    app: {{ .Values.appName }}
{{- end }}