apiVersion: microservice.slime.io/v1alpha2
kind: SmartLimiter
metadata:
  name: ${t_gateway_plugin_name}
<#if t_gateway_plugin_namespace?has_content>
  namespace: ${t_gateway_plugin_namespace}
</#if>
  labels:
<#if t_version?has_content>
    hango-data-version: ${t_version}
</#if>
<#if t_resource_identity?has_content>
    skiff-api-plane-resource-identity: ${t_resource_identity}
</#if>
spec:
  gateway: true
  target:
    direction: outbound
<#if t_gateway_plugin_hosts?has_content>
    host:
<#list t_gateway_plugin_hosts as h>
    - "${h?j_string}"
</#list>
</#if>
<#if t_gateway_plugin_routes?has_content>
    route:
<#list t_gateway_plugin_routes as r>
    - "${r?j_string}"
</#list>
</#if>
<#if t_gateway_plugin_plugins?has_content>
  sets:
    _base:
      descriptor:
    <#list t_gateway_plugin_plugins as p>
      -
<@indent count=8>${p}</@indent>
    </#list>
</#if>