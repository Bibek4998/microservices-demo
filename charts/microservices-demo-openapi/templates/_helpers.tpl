{- define "microservices-demo-openapi.fullname" -}
{- printf "%s-%s" .Release.Name "microservices-demo-openapi" | trunc 63 | trimSuffix "-" -}
{- end -}
