tinymce.PluginManager.requireLangPack('uploadimage');

tinymce.PluginManager.add('uploadimage', function(editor, url) {
  editor.addButton('uploadimage', {
    title: 'Bild vom Computer hochladen',
    icon: url + '/img/uploadimage.png',
    onclick: function() {
      editor.windowManager.open({
        title: 'Bild einfügen',
        url: url + '/dialog.html'
      })
    }
  });

  editor.addMenuItem('uploadimage', {
      text: 'Bild vom Computer hochladen',
      context: 'insert',
      onclick: function() {
        editor.windowManager.open({
          title: 'Bild einfügen',
          url: url + '/dialog.html'
        })
      }
  });
});