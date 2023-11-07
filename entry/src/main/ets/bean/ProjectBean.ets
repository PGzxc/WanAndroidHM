/**
 * @desc：4-项目
 */

export class ProjectData {
  data: ProjectItem[] = [];
}

export class ProjectItem {
  articleList: [] = [];
  author: string = '';
  children: [] = [];
  courseId: number = 0;
  cover: string = '';
  desc: string = '';
  id: number = 0;
  lisense: string = '';
  lisenseLink: string = '';
  name: string = '';
  order: number = 0;
  parentChapterId: number = 0;
  type: number = 0;
  userControlSetTop: boolean = false;
  visible: number = 0;
}