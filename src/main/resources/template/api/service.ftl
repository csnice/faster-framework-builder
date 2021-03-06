${package}
${import}
/**
 * @author faster-builder
 * ${businessCnName} Service
 */
@Service
@Transactional
@AllArgsConstructor
public class ${businessEnNameUpFirst}Service extends ServiceImpl<${businessEnNameUpFirst}Mapper, ${businessEnNameUpFirst}> {

    /**
     * 分页查询
     * @param ${businessEnName} 请求参数
     * @return ${businessCnName}分页列表
     */
    public IPage<${businessEnNameUpFirst}> list(${businessEnNameUpFirst} ${businessEnName}) {
        LambdaQueryWrapper<${businessEnNameUpFirst}> queryWrapper = new LambdaQueryWrapper<>();
<#list columnList as item>
    <#if item.javaType=='String'>
        if (!StringUtils.isEmpty(${businessEnName}.get${item.columnNameHumpUpFirst}())) {
    <#else>
        if (${businessEnName}.get${item.columnNameHumpUpFirst}() != null) {
    </#if>
            queryWrapper.eq(${businessEnNameUpFirst}::get${item.columnNameHumpUpFirst}, ${businessEnName}.get${item.columnNameHumpUpFirst}());
        }
</#list>
        return super.baseMapper.selectPage(${businessEnName}.toPage(), queryWrapper);
    }

    /**
     * 根据主键id查询详情
     * @param id ${businessCnName}id
     * @return ${businessCnName}详情
     */
    public ${businessEnNameUpFirst} queryById(Long id) {
        return super.baseMapper.selectById(id);
    }

    /**
     * 根据条件查询详情
     * @param ${businessEnName} 请求参数
     * @return ${businessCnName}详情
     */
    public ${businessEnNameUpFirst} query(${businessEnNameUpFirst} ${businessEnName}) {
        LambdaQueryWrapper<${businessEnNameUpFirst}> queryWrapper = new LambdaQueryWrapper<>();
<#list columnList as item>
    <#if item.javaType=='String'>
        if (!StringUtils.isEmpty(${businessEnName}.get${item.columnNameHumpUpFirst}())) {
    <#else>
        if (${businessEnName}.get${item.columnNameHumpUpFirst}() != null) {
    </#if>
            queryWrapper.eq(${businessEnNameUpFirst}::get${item.columnNameHumpUpFirst}, ${businessEnName}.get${item.columnNameHumpUpFirst}());
        }
</#list>
        return super.baseMapper.selectOne(queryWrapper);
    }

    /**
    * 添加${businessCnName}
    * @param ${businessEnName}Model 模型
    * @return ResponseEntity
    */
    public ResponseEntity add(${businessEnNameUpFirst}Model ${businessEnName}Model) {
        ${businessEnNameUpFirst} insert = new ${businessEnNameUpFirst}();
        BeanUtils.copyProperties(${businessEnName}Model, insert);
        insert.preInsert();
        super.baseMapper.insert(insert);
        return new ResponseEntity(HttpStatus.CREATED);
    }

    /**
    * 修改${businessCnName}
    * @param ${businessEnName}Model 模型
    * @param id 主键id
    * @return ResponseEntity
    */
    public ResponseEntity update(${businessEnNameUpFirst}Model ${businessEnName}Model, Long id) {
        ${businessEnNameUpFirst} update = new ${businessEnNameUpFirst}();
        BeanUtils.copyProperties(${businessEnName}Model, update);
        update.setId(id);
        update.preUpdate();
        super.baseMapper.updateById(update);
        return new ResponseEntity(HttpStatus.CREATED);
    }

    /**
     * 删除${businessCnName}
     * @param id 主键id
     * @return ResponseEntity
     */
    public ResponseEntity delete(Long id) {
        super.baseMapper.deleteById(id);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }
}