require 'rqrcode'
require 'json'

module Jekyll

  class LabelPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'label.html')
      
      qrcodePage = RQRCode::QRCode.new(site.config['qrproxy']+ category.url);        
      self.data['qrcode'] = qrcodePage.as_svg(module_size: 2.5);
      self.data['title'] = category.data['title'];
      print "generate site: "+dir+" \n";
      self        
    end
  end
  
  class QRBarcodeGenerator < Generator
    safe true

      def generate(site)
        print "generate a QR Labels for the electronic elements\n";
        site.documents.each do | page |
          if page.data['layout'] == 'electronic_element'
             site.pages << LabelPage.new(site, site.source, File.join(page.url,'label'), page)  
          end
        end
      end
  end
end  