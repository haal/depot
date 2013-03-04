# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# clear products before each seeding
Product.delete_all
# add en books
Product.create(:title => 'Web Design for Developers',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :image_url =>   '/assets/wd4d.jpg',    
  :price => 42.95,
  :locale => :en)
# . . .
Product.create(:title => 'Programming Ruby 1.9',
  :description =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  :image_url => '/assets/ruby.jpg',
  :price => 49.50,
  :locale => :en)
# . . .

Product.create(:title => 'Rails Test Prescriptions',
  :description => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :image_url => '/assets/rtp.jpg',
  :price => 43.75,
  :locale => :en)

# add bs books
Product.create(:title => 'Divna tama',
  :description => 
    %{<p>
        <em>Divna tama</em>, nestrpljivo iščekivani drugi dio trilogije Kami Garcije i Margaret Stohl, 
        slojevita je i uzbudljiva priča puna neočekivanih preokreta, koja će ispuniti pa čak i nadmašiti 
        očekivanja fanova "Divnih stvorenja". Ethan i Lena u drugom se nastavku trilogije suočavaju s 
        posljedicama događaja koji su u noći proslave Lenina šesnaestog rođendana iz temelja potresli 
        njihov život.
      </p>},
  :image_url =>   '/assets/divna_tama.jpg',    
  :price => 30.95,
  :locale => :bs)
# . . .
Product.create(:title => 'Ja sam Zlatan Ibrahimović',
  :description =>
    %{<p>
        Knjiga <em>Ja sam Zlatan</em>, službena je biografija Zlatana Ibrahimovića, najuspješnijeg švedskog fudbalera 
        ikada i jednog od najvećih igrača današnjice. Zlatanova priča, prava priča o uspjehu, započinje 
        opisom njegovog odrastanja u opasnim imigranatskim predgrađima Rosengarda, izvan grada Malmea, nastavlja 
        s otkrićem Zlatanovog jedinstvenog talenta i prati njegov boravak u nekim od najvećih evropskih fudbalskih 
        klubova: Ajax, Juventus, Inter, Barcelona i Milan. Biografiju je napisao David Lagercrantz, autor poznat 
        u Švedskoj po nevjerojatnim biografijama i po vrlo hvaljenim književnim djelima. Nakon što je proveo 
        mnogo sati intervjuirajući, Lagercrantz je uspio uhvatiti Zlatanovu osobnu i nikada prije ispričanu priču. 
        U knjizi bilježi jedinstveni glas imigrantskog klinca, odraslog na ulici, koji je sada jedan od deset 
        najbolje plaćenih fudbalera na svijetu.
      </p>},
  :image_url => '/assets/ja_sam_zlatan.jpg',
  :price => 20.00,
  :locale => :bs)
# . . .

Product.create(:title => 'Otkup sirove kože',
  :description => 
    %{<p>
        U autobiografiji <em>Otkup sirove</em> kože Abdulah Sidran piše, dakako, o ljudima, vremenima i 
        gradovima, koje je upoznao i koje su ga za sva vremena determinirali. Sidran tako piše o 
        Emiru Kusturici, Goranu Babiću i Slobodanu Praljku, o Sarajevu, Goraždu i Veneciji, o politici, 
        povijesti, ratovima i logorima, o filmu i poeziji, i općenito o iskustvu umjetnosti. Otkup sirove 
        kože je, kao svojevrsni završetak rada na svojoj autobiografiji, započet davno, još na scenariju 
        za film Otac na službenom putu, ponajprije jedinstven i fascinantan obiteljski roman.
      </p>},
  :image_url => '/assets/otkup_sirove_koze.jpg',
  :price => 20.00,
  :locale => :bs)

# add payment types
PaymentType.delete_all
PaymentType.create(:name => "Check")
PaymentType.create(:name => "Credit card")
PaymentType.create(:name => "Purchase order")
