import com.smec.eim.modular.pojo.dto.PageDto;
import com.smec.eim.modular.pojo.dto.ResultBean;
import com.smec.eim.modular.pojo.model.UserInfo;


/**
* @author LinkChen
* @date 2021-12-16 15:25
*/
public interface ${classInfo.className}Service {

    /**
    * 新增
    */
    public ResultBean insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 删除
    */
    public ResultBean delete(String id);

    /**
    * 更新
    */
    public ResultBean update(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 根据主键 id 查询
    */
    public ResultBean load(String id);

    /**
    * 条件分页查询
    */
    public ResultBean pageListByUserInfo(PageDto pageDto,${classInfo.className} ${classInfo.className?uncap_first});


    /**
    * 条件查询
    */
    public ResultBean loadListByUserInfo(${classInfo.className} ${classInfo.className?uncap_first});

}
