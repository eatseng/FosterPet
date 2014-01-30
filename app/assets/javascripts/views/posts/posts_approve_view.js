FosterPet.Views.PostsApproveView = Backbone.View.extend({
  events: {
    "click button.public" : "makePublic",
    "click button.private" : "makePrivate",
    "click img.post_photo" : "photo"
  },

  initialize: function(options) {
    this.public_collection = options.public_collection;
    this.approve_collection = options.approve_collection;
    this.listenTo(this.approve_collection, "add remove", this.render);
  },

  template: JST['posts/approve'],

  render: function() {
    var that = this;
    $.when(this.approve_collection.fetch(), this.public_collection.fetch()
        ).then(function() {
      var renderedContent = that.template({
        publicshares: that.public_collection,
        postshares: that.approve_collection
      });
      that.$el.html(renderedContent);
    });
    return this;
  },

  makePublic: function(event) {
    event.preventDefault();
    var postshare = this.approve_collection.get($(event.target).attr('ps_id'))
    postshare.destroy();
  },

  makePrivate: function(event) {
    event.preventDefault();
    var postshare = new FosterPet.Models.Postshare();
    postshare.set({publicshare_id: $(event.target).attr('ps_id')});
    this.approve_collection.create(postshare, {})
  },

  photo: function() {
    $('img.modal_photo').attr('src', $(event.target).attr('src'));
    $('img.modal_photo').attr('alt', $(event.target).attr('alt'));
    $('.modal-photo-title').text($(event.target).attr('alt'));
    $('#signUpModal').remove()
    $('#signInModal').remove()
    $('#guestModal').remove()
    $('#pictureModal').modal();
  },

  _close:function() {
  }
});