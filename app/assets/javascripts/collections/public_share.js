FosterPet.Collections.PublicShares = Backbone.Collection.extend({
  model: FosterPet.Models.Postshare,
  url: '/publicshare',
  comparator: function(val1, val2) {
    if (val1.get('created_at') > val2.get('created_at')) {
      return -1;
    } else if (val1.get('created_at') < val2.get('created_at')) {
      return 1;
    } else {
      return 0;
    }
  }
});