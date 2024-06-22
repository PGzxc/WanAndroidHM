
/**
 * @desc：工具类
 */

//1-判断是否为空字符串
const isEmpty = (data:string|[]|number|object) => {
  return data == undefined || data == "" || (data as []).length <= 0 || data === '0'

};
//2-格式化字符串
const formatHtml = (html:string) => {
  let data = ''
  if (!isEmpty(html)) {
    let regSymbol = RegExp("&.*;")
    let regHtml = RegExp(/<[^>]*>/g);
    data = html.replace(regSymbol, '').replace(regHtml, '')
  }
  return data
}

export {
  isEmpty,
  formatHtml
};