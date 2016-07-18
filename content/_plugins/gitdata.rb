module Jekyll

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      print 'halllo \n'
      value = `git rev-parse --abbrev-ref HEAD`
      #value = `echo $(pwd)`
      site.config['branche'] = value

      site.pages.each do | page |
        cmd = 'git log --pretty=oneline --abbrev-commit --pretty=format:"%H" -1 ' + page.path
        file =  `#{cmd}`
        page.data['hash'] = file
      end
      
      site.documents.each do | document |
        print document.path
        cmd = 'git log --pretty=oneline --abbrev-commit --pretty=format:"%H" -1 ' + document.path
        file =  `#{cmd}`
        document.data['hash'] = file
      end
    end
  end

end