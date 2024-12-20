
<#if condition && condition_1>
  ...
<#elseif condition2>
  ...
<#elseif condition3>
  ...
...
<#else>
   <#if  condition>
    ...
   </#if>
</#if>


<#list items as item>
    ${item?index} 从0开始的索引
    ${item?counter}  从1开始的索引
    ${item?is_first} 是否为第一项
    ${item?is_last} 是否为最后一项
    ${item?is_even_item} 索引根据0计算，是否为奇数，1、3、5...
    ${item?is_odd_item} 索引根据0计算，是否为偶数，0、2、4
    ${item?has_next} 当前项后面是否为最后一项，与 is_last 结果相反
<#list>


<#if sex="1">
    <label>男</label>
<#elseif sex="2">
    <label>女</label>
<#elseif sex="3">
    <label>未知</label>
<#else>
    <label>性别不能为空</label>
</#if>


<#if x == 1>
  x is 1
  <#if y == 1>
    and y is 1 too
  <#else>
    but y is not
  </#if>
<#else>
  x is not 1
  <#if y < 0>
    and y is less than 0
  </#if>
</#if>


<#if (sex="1" || sex="2")>
    <p>性别是有效的</p>
<#else>
    <p>无效的性别</p>
</#if>
    
<#if version??>
    <p>版本信息：${version}</p>
</#if>