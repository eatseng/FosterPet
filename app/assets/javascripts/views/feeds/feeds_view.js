FosterPet.Views.Feeds = Backbone.View.extend({
  template: JST['feeds/feeds'],

  render: function() {
    var renderedContent = this.template ({
      feeds: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  }
});