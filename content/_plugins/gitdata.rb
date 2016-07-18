module Jekyll

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      print 'Current Branch: '
      
      if ENV['JEKYLL_GIT_BRANCH']
        value = ENV['JEKYLL_GIT_BRANCH']
      else
        value = `git rev-parse --abbrev-ref HEAD`
      end
      print value
      currentFolder = `echo $(pwd)`
      print currentFolder
      print `git rev-parse --abbrev-ref HEAD`
      print `git config --list`
      print `git --version`
      site.config['branche'] = value.strip!

      site.pages.each do | page |
        cmd = 'git log --pretty=oneline --abbrev-commit --pretty=format:"%H" -1 ' + page.path
        file =  `#{cmd}`
        page.data['hash'] = file
      end
      
      site.documents.each do | document |
        # print document.path
        cmd = 'git log --pretty=oneline --abbrev-commit --pretty=format:"%H" -1 ' + document.path
        file =  `#{cmd}`
        document.data['hash'] = file
      end
    end
  end

end