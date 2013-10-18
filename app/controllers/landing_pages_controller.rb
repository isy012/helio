class LandingPagesController < ApplicationController
  def home
  end

  def about
  end

  def faq
  end
  
  def showprimes
     	count = 10

    	@primes = []
    	candidate = 2
    	
      while @primes.length < count
      		is_prime = true
      		@primes.each do |prime|
        	if (candidate % prime) == 0 then
          	is_prime = false
          	break
        	end
      end
      
      	if is_prime then
        	@primes << candidate
      	end
      
      	candidate += 1
        end

        @books = Book.all

      end
  	
end
