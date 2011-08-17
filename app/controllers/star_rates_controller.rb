class StarRatesController < ApplicationController
  # GET /star_rates
  # GET /star_rates.xml
  def index
    @star_rates = StarRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @star_rates }
    end
  end

  # GET /star_rates/1
  # GET /star_rates/1.xml
  def show
    @star_rate = StarRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @star_rate }
    end
  end

  # GET /star_rates/new
  # GET /star_rates/new.xml
  def new
    @star_rate = StarRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @star_rate }
    end
  end

  # GET /star_rates/1/edit
  def edit
    @star_rate = StarRate.find(params[:id])
  end

  # POST /star_rates
  # POST /star_rates.xml
  def create
    @star_rate = StarRate.new(params[:star_rate])

    respond_to do |format|
      if @star_rate.save
        format.html { redirect_to(@star_rate, :notice => 'Star rate was successfully created.') }
        format.xml  { render :xml => @star_rate, :status => :created, :location => @star_rate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @star_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /star_rates/1
  # PUT /star_rates/1.xml
  def update
    @star_rate = StarRate.find(params[:id])

    respond_to do |format|
      if @star_rate.update_attributes(params[:star_rate])
        format.html { redirect_to(@star_rate, :notice => 'Star rate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @star_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /star_rates/1
  # DELETE /star_rates/1.xml
  def destroy
    @star_rate = StarRate.find(params[:id])
    @star_rate.destroy

    respond_to do |format|
      format.html { redirect_to(star_rates_url) }
      format.xml  { head :ok }
    end
  end
end
