import Taro from "@tarojs/taro";
import {View, Image} from '@tarojs/components'
import {AtButton} from 'taro-ui'
import headerBg from '../../assets/图片背景.png'
import GlobalFooter from "../../components/GlobalFooter";
import './index.scss'

/**
 * 首页
 */
export default () => {
  return (
    <View className='indexPage'>
      <View className='at-article__h1 title'>
        MBTI性格测试
      </View>
      <View className='at-article__h2 subTitle'>
        只需两分钟，就能让你从新认识自己
      </View>
      <AtButton type='primary' circle className='enterBtn' onClick={() => {
        // 跳转到目的页面，打开新页面
        Taro.navigateTo({
          url: '/pages/doQuestion/index',
        })
      }}
      >
        开始测试
      </AtButton>
      <Image
        style='width: 300px;height: 400px;background: #fff;'
        src={headerBg}
        className='headrerBg'
      />
      <GlobalFooter />
    </View>
  )
}
