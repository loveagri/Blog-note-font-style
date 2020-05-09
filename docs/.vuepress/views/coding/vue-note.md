---
layout: post
title: "🛸vue 知识点小计"
date: 2018-05-02
categories:
  -   Coding
tags:
  - vue
---

#### <tagLabel text ="记录些平时遇到的令人疑惑的点" type="tig" /> <tagLabel text ="vue中有意思的东西" type="tig" /> 

## API

### vm.$set()
::: tip
向响应式对象中添加一个属性，并确保这个新属性同样是响应式的，且触发视图更新。它必须用于向响应式对象上添加新属性，因为 Vue 无法探测普通的新增属性 
:::
```js
vm.$set(this.myObject, 'newProperty', 'hi') // 响应式 触发视图更新
this.myObject.newProperty = 'hi' // 非响应式 不触发视图更新
```
### vm.$refs
::: warning
 `vue`中的`this.$refs`为空出现原因分析
 - `mounted`之前是获取不到的，因为`DOM`没有更新。
 - `this.$refs`的组件在`v-if`为`false`的父节点下，导致这个子组件未渲染。

**组件已经渲染成功才能调用组件的数据。而不是页面加载完成后就一定能获取到**
:::
### vm.$nextTick()
::: tip
在下次 DOM 更新循环结束之后执行延迟回调。在修改数据之后立即使用这个方法，获取更新后的 DOM。(需要`promise > polyfill`)
:::
```js
// element UI dialog 中 form resetFields 报错
// 组件未渲染 ， 导致 this.$refs.form 为 undefined
this.$nextTick(() => {
  this.$refs['form'].resetFields()
})

// 原理示意
this.msg = 'Hello'
// DOM 还没有更新
this.$nextTick(() => {
  // DOM 更新了
})
this.$nextTick()
  .then(_ => {
    // DOM 更新了
  })
```


### v-on:click="handle('ok', $event)"
::: tip
在监听原生` DOM `事件时，方法以事件为唯一的参数。如果使用内联语句，语句可以访问一个` $event `属性
:::
```vue
<div @click="handleTick('msg', $event)"></div> 
```
