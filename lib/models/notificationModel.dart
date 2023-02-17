class notificationModel{
  String image;
  String title;
  String comment;
  String type;
  String color;
  notificationModel(this.image, this.title, this.comment, this.type, this.color);
}

List<notificationModel> listNotification = [
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','New','0xff27AE60'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','Hot','0xffEB5757'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','Hot','0xffEB5757'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','New','0xff27AE60'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','New','0xff27AE60'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','New','0xff27AE60'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','New','0xff27AE60'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','New','0xff27AE60'),
  notificationModel('assets/img/table.png', 'Your order #123456789 has been confirmed','Lorem ipsum dolor sit amet, consectetur adipiscing elit','New','0xff27AE60'),
];