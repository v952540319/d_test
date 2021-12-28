<#if isAutoImport?exists && isAutoImport==true>
import java.io.Serializable;
import java.util.Date;
import java.util.List;
</#if>
import com.definesys.mpaas.query.annotation.*;
import com.definesys.mpaas.query.json.MpaasDateTimeDeserializer;
import com.definesys.mpaas.query.json.MpaasDateTimeSerializer;
import com.definesys.mpaas.query.model.MpaasBasePojo;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Table(value = "${classInfo.originTableName}")
public class ${classInfo.className} extends MpaasBasePojo implements Serializable  {

    private static final long serialVersionUID = 1L;


    @RowID(sequence = "${classInfo.originTableName}_s", type = RowIDType.AUTO)
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    <#if isComment?exists && isComment==true>/**
    * ${fieldItem.fieldComment}
    */</#if>
         <#if fieldItem.fieldClass=="Date">
    @JsonSerialize(using = MpaasDateTimeSerializer.class)
    @JsonDeserialize(using = MpaasDateTimeDeserializer.class)
    @Style(displayName = "${fieldItem.fieldComment}", format="yyyy/MM/dd")
         <#else>
    @Style(displayName = "${fieldItem.fieldComment}")
        </#if>
        <#if fieldItem.columnName== "object_version_number">
    @SystemColumn(SystemColumnType.OBJECT_VERSION)
    @Column(value = "object_version_number")
    private Integer objectVersionNumber;
    <#elseif fieldItem.columnName== "created_by">
    @SystemColumn(SystemColumnType.CREATE_BY)
    @Column(value = "created_by")
    private String createdBy;
    <#elseif fieldItem.columnName== "creation_date">
    @SystemColumn(SystemColumnType.CREATE_ON)
    @Column(value = "creation_date")
    private Date creationDate;
    <#elseif fieldItem.columnName== "last_updated_by">
    @SystemColumn(SystemColumnType.LASTUPDATE_BY)
    @Column(value = "last_updated_by")
    private String lastUpdatedBy;
    <#elseif fieldItem.columnName== "last_update_date">
    @SystemColumn(SystemColumnType.LASTUPDATE_ON)
    @Column(value = "last_update_date")
    private Date lastUpdateDate;
    <#else>
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};
    </#if>
</#list>
</#if>

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    public ${classInfo.className}() {
    }

<#list classInfo.fieldList as fieldItem>
    public ${fieldItem.fieldClass} get${fieldItem.fieldName?cap_first}() {
        return ${fieldItem.fieldName};
    }

    public void set${fieldItem.fieldName?cap_first}(${fieldItem.fieldClass} ${fieldItem.fieldName}) {
        this.${fieldItem.fieldName} = ${fieldItem.fieldName};
    }

</#list>
</#if>
}
