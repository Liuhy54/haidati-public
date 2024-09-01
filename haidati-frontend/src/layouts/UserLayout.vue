<template>
  <div id="userLayout">
    <a-layout style="height: 100vh">
      <a-layout-header class="header">
        <a-space>
          <img class="logo" src="../assets/logo.png" />
          <img class="logo" src="../assets/da.png" />
          <img class="logo" src="../assets/ti.png" />
        </a-space>
        <div> AI 答题应用平台</div>
      </a-layout-header>
      <a-layout-content class="content">
        <router-view />
      </a-layout-content>
      <a-layout-footer class="footer">
        海答题应用平台
      </a-layout-footer>
    </a-layout>
  </div>
</template>

<script setup lang="ts">
</script>

<style scoped>
#userLayout {
  text-align: center;
  background: url("https://gw.alipayobjects.com/zos/rmsportal/FfdJeJRQWjEeGTpqgBKj.png")
    0% 0% / 100% 100%;
}

#userLayout .logo {
  width: 48px;
  height: 48px;
  margin-top: 40px;    /* 上边距 */
  margin-right: 2px;  /* 右边距 */
  margin-bottom: 10px; /* 下边距 */
  margin-left: 2px;   /* 左边距 */
}

#userLayout .header {
  margin-top: 16px;
  font-size: 21px;
}

#userLayout .content {
  margin-bottom: 16px;
  padding: 20px;
}

.footer {
  padding: 16px;
  text-align: center;
  background: #efefef;
}
</style>
