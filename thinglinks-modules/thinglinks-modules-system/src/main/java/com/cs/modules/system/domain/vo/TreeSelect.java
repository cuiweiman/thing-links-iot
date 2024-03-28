package com.cs.modules.system.domain.vo;

import com.cs.api.system.domain.SysDept;
import com.cs.modules.system.domain.SysMenu;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @description: TreeSelect 树结构实体类
 * @author: cuiweiman
 * @date: 2024/3/28 11:35
 */
@Data
public class TreeSelect implements Serializable {

    /**
     * 节点ID
     */
    private Long id;

    /**
     * 节点名称
     */
    private String label;

    /**
     * 子节点
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<TreeSelect> children;

    public TreeSelect() {

    }

    public TreeSelect(SysDept dept) {
        this.id = dept.getDeptId();
        this.label = dept.getDeptName();
        this.children = dept.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    public TreeSelect(SysMenu menu) {
        this.id = menu.getMenuId();
        this.label = menu.getMenuName();
        this.children = menu.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList());
    }

}
