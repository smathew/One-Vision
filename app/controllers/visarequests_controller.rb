class VisarequestsController < ApplicationController
  # GET /visarequests
  # GET /visarequests.xml
  def index
    @visarequests = Visarequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visarequests }
    end
  end

  # GET /visarequests/1
  # GET /visarequests/1.xml
  def show
    @visarequest = Visarequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visarequest }
    end
  end

  # GET /visarequests/new
  # GET /visarequests/new.xml
  def new
    @visarequest = Visarequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @visarequest }
    end
  end

  # GET /visarequests/1/edit
  def edit
    @visarequest = Visarequest.find(params[:id])
  end

  # POST /visarequests
  # POST /visarequests.xml
  def create
    @visarequest = Visarequest.new(params[:visarequest])

    respond_to do |format|
      if @visarequest.save
        flash[:notice] = 'Your Visa Request Application has been successfully submitted.'
		
		#send the visa request application of the member to the credit union by email
		Emailer.deliver_visarequest_email(@visarequest)
        format.html { redirect_to(@visarequest) }
        format.xml  { render :xml => @visarequest, :status => :created, :location => @visarequest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visarequest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visarequests/1
  # PUT /visarequests/1.xml
  def update
    @visarequest = Visarequest.find(params[:id])

    respond_to do |format|
      if @visarequest.update_attributes(params[:visarequest])
        flash[:notice] = 'Visarequest was successfully updated.'
        format.html { redirect_to(@visarequest) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visarequest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visarequests/1
  # DELETE /visarequests/1.xml
  def destroy
    @visarequest = Visarequest.find(params[:id])
    @visarequest.destroy

    respond_to do |format|
      format.html { redirect_to(visarequests_url) }
      format.xml  { head :ok }
    end
  end
end
