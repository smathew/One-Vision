class MemberappsController < ApplicationController
  # GET /memberapps
  # GET /memberapps.xml
  def index
    @memberapps = Memberapp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memberapps }
    end
  end

  # GET /memberapps/1
  # GET /memberapps/1.xml
  def show
    @memberapp = Memberapp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @memberapp }
    end
  end

  # GET /memberapps/new
  # GET /memberapps/new.xml
  def new
    @memberapp = Memberapp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @memberapp }
    end
  end

  # GET /memberapps/1/edit
  def edit
    @memberapp = Memberapp.find(params[:id])
  end

  # POST /memberapps
  # POST /memberapps.xml
  def create
    @memberapp = Memberapp.new(params[:memberapp])

    respond_to do |format|
      if @memberapp.save
        flash[:notice] = 'Online Membership Application has been successfully submitted.'
		
		#send the membership application to the credit union
		Emailer.deliver_memberapp_email(@memberapp)
        format.html { redirect_to(@memberapp) }
        format.xml  { render :xml => @memberapp, :status => :created, :location => @memberapp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @memberapp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memberapps/1
  # PUT /memberapps/1.xml
  def update
    @memberapp = Memberapp.find(params[:id])

    respond_to do |format|
      if @memberapp.update_attributes(params[:memberapp])
        flash[:notice] = 'Memberapp was successfully updated.'
        format.html { redirect_to(@memberapp) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @memberapp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memberapps/1
  # DELETE /memberapps/1.xml
  def destroy
    @memberapp = Memberapp.find(params[:id])
    @memberapp.destroy

    respond_to do |format|
      format.html { redirect_to(memberapps_url) }
      format.xml  { head :ok }
    end
  end
end
