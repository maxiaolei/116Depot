class BookInNeedsController < ApplicationController
  skip_before_filter :authorize
  # GET /book_in_needs
  # GET /book_in_needs.xml
  def index
    @book_in_needs = BookInNeed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @book_in_needs }
    end
  end

  # GET /book_in_needs/1
  # GET /book_in_needs/1.xml
  def show
    @book_in_need = BookInNeed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book_in_need }
    end
  end

  # GET /book_in_needs/new
  # GET /book_in_needs/new.xml
  def new
    @book_in_need = BookInNeed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book_in_need }
    end
  end

  # GET /book_in_needs/1/edit
  def edit
    @book_in_need = BookInNeed.find(params[:id])
  end

  # POST /book_in_needs
  # POST /book_in_needs.xml
  def create
    @book_in_need = BookInNeed.new(params[:book_in_need])

    respond_to do |format|
      if @book_in_need.save
        format.html { redirect_to(@book_in_need, :notice => 'Book in need was successfully created.') }
        format.xml  { render :xml => @book_in_need, :status => :created, :location => @book_in_need }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book_in_need.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /book_in_needs/1
  # PUT /book_in_needs/1.xml
  def update
    @book_in_need = BookInNeed.find(params[:id])

    respond_to do |format|
      if @book_in_need.update_attributes(params[:book_in_need])
        format.html { redirect_to(@book_in_need, :notice => 'Book in need was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book_in_need.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /book_in_needs/1
  # DELETE /book_in_needs/1.xml
  def destroy
    @book_in_need = BookInNeed.find(params[:id])
    @book_in_need.destroy

    respond_to do |format|
      format.html { redirect_to(book_in_needs_url) }
      format.xml  { head :ok }
    end
  end
end
