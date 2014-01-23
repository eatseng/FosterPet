FosterPet.Views.PetWallView = Backbone.View.extend({
  initialize: function(options) {
    this.pet = options.pet;
    this.post_collection = options.post_collection;
    this.listenTo(this.post_collection, "add remove change sync", this.render);
  },

  events: {
    "click .btn-post" : "submitPost",
    "click .btn-add-photo": "addPhoto"
  },

  template: JST['pets/petwall'],
  templateWallPostForm: JST['pets/postform'],
  photoTemplate: JST['photo/form'],

  render: function() {
    var that = this;
    var petWallPosts = new FosterPet.Collections.PetWallPosts(this.id);
    petWallPosts.fetch({
      success: function() {
        var renderedContent = that.template({
          wallPosts: petWallPosts
        });
        that.$el.html(renderedContent);
        that.$('.pet_wall#pet_post').html(that.templateWallPostForm({pet: that.pet}));
      }
    });

    return this;
  },

  submitPost: function(event) {
    event.preventDefault();
    var attrs = $('form').serializeJSON();
    var postModel = new FosterPet.Models.Post().set(attrs);
    this.post_collection.create(postModel, {
      success: function(){
        //Backbone.history.navigate("", {trigger:true});
      }
    });
  },

  addPhoto: function(event) {
    event.preventDefault();
    $('.photo_container').append(this.photoTemplate());
  }
});