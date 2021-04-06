class Article {
  String avatar;
  String nickname;
  int type;
  String text_title;
  List images;
  String videos;
  int share_number;
  int comments_number;
  int like_number;
  int created_at;

  Article({
    this.avatar,
    this.nickname,
    this.type,
    this.text_title,
    this.images,
    this.videos,
    this.share_number,
    this.comments_number,
    this.like_number,
    this.created_at,
  });
}

List<Article> lists = [
  Article(
    avatar:
        'https://pics0.baidu.com/feed/a686c9177f3e6709665d2ed0c933213bf9dc55bf.jpeg?token=c923a2fa85ba4a5283ebede1db712492',
    nickname: 'Roger Federer',
    type: 1,
    text_title:
        '罗杰·费德勒（Roger Federer），1981年8月8日出生于瑞士巴塞尔，瑞士男子职业网球运动员，以全面稳定的技术、华丽积极的球风、绅士优雅的形象而著称。众多评论家、现役与退役的选手认为费德勒是史上最伟大球员之一。费德勒不仅在网球领域取得成功，亦在慈善和商业领域活跃。',
    images: [],
    videos: null,
    share_number: 0,
    comments_number: 0,
    like_number: 0,
    created_at: 1617636203825,
  ),
  Article(
    avatar:
        'https://pics0.baidu.com/feed/a686c9177f3e6709665d2ed0c933213bf9dc55bf.jpeg?token=c923a2fa85ba4a5283ebede1db712492',
    nickname: '小楼一夜听春雨',
    type: 2,
    text_title: '费德勒拥有ATP史上最长连续单打世界第一周数的纪录（237周，2004–2008年间），在大满贯男子单打斩获20次冠军 [1]  ，11次亚军.',
    images: ['https://bkimg.cdn.bcebos.com/pic/1e30e924b899a9014c086dfc1cdc1d7b02087af45fea'],
    videos: null,
    share_number: 2,
    comments_number: 0,
    like_number: 1,
    created_at: 1617636203825,
  ),
  Article(
    avatar: 'https://bkimg.cdn.bcebos.com/pic/4e4a20a4462309f732280294720e0cf3d6cad6f5',
    nickname: 'Andy Murray',
    type: 3,
    text_title: '安迪·穆雷（Andy Murray），1987年5月15日出生于英国苏格兰邓布兰，英国著名男子职业网球运动员.',
    images: [
      'https://bkimg.cdn.bcebos.com/pic/1e30e924b899a9014c086dfc1cdc1d7b02087af45fea',
      'https://bkimg.cdn.bcebos.com/pic/1e30e924b899a9014c086dfc1cdc1d7b02087af45fea',
      'https://bkimg.cdn.bcebos.com/pic/1e30e924b899a9014c086dfc1cdc1d7b02087af45fea',
    ],
    videos: null,
    share_number: 2,
    comments_number: 0,
    like_number: 1,
    created_at: 1617636203825,
  ),
];
