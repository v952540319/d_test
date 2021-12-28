package com.smec.eim.modular.service.impl;


import com.definesys.mpaas.log.SWordLogger;
import com.definesys.mpaas.query.MpaasQuery;
import com.definesys.mpaas.query.MpaasQueryFactory;
import com.definesys.mpaas.query.db.PageQueryResult;
import com.github.pagehelper.PageInfo;

import com.smec.eim.modular.pojo.dto.PageDto;
import com.smec.eim.modular.pojo.dto.ResultBean;
import com.smec.eim.modular.pojo.model.${classInfo.className};
import com.smec.eim.modular.service.${classInfo.className}Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;


/**
* @author LinkChen
* @date 2021-12-16 15:25
*/
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

    @Autowired
    private MpaasQueryFactory sw;
    
    @Autowired
    private SWordLogger logger;
    
    @Override
    public ResultBean insert(${classInfo.className} ${classInfo.className?uncap_first}) {
        sw.buildQuery().doInsert(${classInfo.className?uncap_first});
        return new ResultBean("200","插入成功",new HashMap(16));
    }
    
    @Override
    public ResultBean delete(String id) {
        sw.buildQuery()
        .rowid("id", id+"")
        .doDelete(${classInfo.className}.class);
        return new ResultBean("200","删除成功",new HashMap(16));
    }
    
    @Override
    public ResultBean update(${classInfo.className} ${classInfo.className?uncap_first}) {
        sw.buildQuery()
        .rowid("id", ${classInfo.className?uncap_first}.getId()+"")
        .doUpdate(${classInfo.className?uncap_first});
        return new ResultBean("200","更新成功",new HashMap(16));
    }
    
    @Override
    public ResultBean load(String id) {
        ${classInfo.className} ${classInfo.className?uncap_first} = sw.buildQuery()
        .rowid("id", id)
        .doQueryFirst(${classInfo.className}.class);
        return new ResultBean("200","查询成功",${classInfo.className?uncap_first});
    }
    
    @Override
    public ResultBean loadListBy${classInfo.className}(${classInfo.className} ${classInfo.className?uncap_first}) {
        MpaasQuery mpaasQuery = sw.buildQuery();
<#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldClass=="String" && fieldItem.columnName!= "object_version_number" && fieldItem.columnName!= "created_by"&&fieldItem.columnName!= "creation_date"&&fieldItem.columnName!= "last_updated_by"&&fieldItem.columnName!= "last_update_date">
        if(StringUtils.isNotBlank(${classInfo.className?uncap_first}.get${fieldItem.fieldName?cap_first}())){
            mpaasQuery.like("${fieldItem.columnName}",${classInfo.className?uncap_first}.get${fieldItem.fieldName?cap_first}());
        }
    </#if>
</#list>
        List<${classInfo.className}> ${classInfo.className?uncap_first}List = mpaasQuery.doQuery(${classInfo.className}.class);
        return new ResultBean("200","查询成功",${classInfo.className?uncap_first}List);
    }

    @Override
    public ResultBean pageListBy${classInfo.className}(PageDto pageDto,${classInfo.className} ${classInfo.className?uncap_first}) {
        MpaasQuery mpaasQuery = sw.buildQuery();
<#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldClass=="String" && fieldItem.columnName!= "object_version_number" && fieldItem.columnName!= "created_by"&&fieldItem.columnName!= "creation_date"&&fieldItem.columnName!= "last_updated_by"&&fieldItem.columnName!= "last_update_date">
        if(StringUtils.isNotBlank(${classInfo.className?uncap_first}.get${fieldItem.fieldName?cap_first}())){
            mpaasQuery.like("${fieldItem.columnName}",${classInfo.className?uncap_first}.get${fieldItem.fieldName?cap_first}());
        }
    </#if>
</#list>
        PageQueryResult<${classInfo.className}> result = mpaasQuery
            .doPageQuery(pageDto.getPage(), pageDto.getSize(), ${classInfo.className}.class);

        PageInfo<${classInfo.className}> pageInfo = new PageInfo<>(result.getResult());
        pageInfo.setPageNum(pageDto.getPage());
        pageInfo.setPageSize(pageDto.getSize());
        pageInfo.setTotal(result.getCount()); 
        return new ResultBean("200","查询成功",pageInfo); 
    }
}