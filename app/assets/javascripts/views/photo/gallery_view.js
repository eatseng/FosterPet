FosterPet.Views.GalleryView = Backbone.View.extend({
  events: {
    "click button.back" : "back"
  },

  template: JST['photo/gallery'],

  render: function(){
    var renderedContent = this.template({
      photos: this.collection,
      id: this.id
    });
    this.$el.html(renderedContent);
    return this;
  },

  back: function() {
    Backbone.history.navigate("", { trigger: true });
  }
});