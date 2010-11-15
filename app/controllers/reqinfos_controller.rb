class ReqinfosController < ApplicationController
  # GET /reqinfos
  # GET /reqinfos.xml
  def index
    @reqinfos = Reqinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reqinfos }
    end
  end

  # GET /reqinfos/1
  # GET /reqinfos/1.xml
  def show
    @reqinfo = Reqinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reqinfo }
    end
  end

  # GET /reqinfos/new
  # GET /reqinfos/new.xml
  def new
    @reqinfo = Reqinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reqinfo }
    end
  end

  # GET /reqinfos/1/edit
  def edit
    @reqinfo = Reqinfo.find(params[:id])
  end

  # POST /reqinfos
  # POST /reqinfos.xml
  def create
    @reqinfo = Reqinfo.new(params[:reqinfo])

    respond_to do |format|
      if @reqinfo.save
        flash[:notice] = 'Your request for more information has been successfully submitted.'
		# Tell the Emailer to send an Email after save
		Emailer.deliver_reqinfo_email(@reqinfo)
        format.html { redirect_to(@reqinfo) }
        format.xml  { render :xml => @reqinfo, :status => :created, :location => @reqinfo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reqinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reqinfos/1
  # PUT /reqinfos/1.xml
  def update
    @reqinfo = Reqinfo.find(params[:id])

    respond_to do |format|
      if @reqinfo.update_attributes(params[:reqinfo])
        flash[:notice] = 'Reqinfo was successfully updated.'
        format.html { redirect_to(@reqinfo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reqinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reqinfos/1
  # DELETE /reqinfos/1.xml
  def destroy
    @reqinfo = Reqinfo.find(params[:id])
    @reqinfo.destroy

    respond_to do |format|
      format.html { redirect_to(reqinfos_url) }
      format.xml  { head :ok }
    end
  end
end
