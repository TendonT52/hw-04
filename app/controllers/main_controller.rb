class MainController < ApplicationController
  def root
    @nums = [1,2,3,4,5,6,7,8,9, 10]
  end
  def test
    puts params.inspect
    @n = params[:num].to_i
    re = true
    @ls = []
    @ln = []
    for i in 1..@n do
      if params["subject#{i}"]=="" or params["score#{i}"]=="" 
        re = false
        break
      else 
        @ls = @ls.append(params["subject#{i}"])
        @ln = @ln.append(params["score#{i}"])
      end
    end
    if re and params[:root]=="false"
      @ans = @ln.each_with_index.max[1]
      puts @ls[@ans]
      redirect_to controller: 'main', action: 'result', sub: @ls[@ans], score: @ln[@ans]
    end
  end
  def result
    puts params.inspect
  end
end
