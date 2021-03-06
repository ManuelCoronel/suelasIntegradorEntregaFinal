/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author MANUEL
 */
@Entity
@Table(name = "pedido_de_venta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PedidoDeVenta.findAll", query = "SELECT p FROM PedidoDeVenta p")
    , @NamedQuery(name = "PedidoDeVenta.findById", query = "SELECT p FROM PedidoDeVenta p WHERE p.id = :id")
    , @NamedQuery(name = "PedidoDeVenta.findByFechaOrden", query = "SELECT p FROM PedidoDeVenta p WHERE p.fechaOrden = :fechaOrden")
    , @NamedQuery(name = "PedidoDeVenta.findByTotal", query = "SELECT p FROM PedidoDeVenta p WHERE p.total = :total")
    , @NamedQuery(name = "PedidoDeVenta.findByFechaEntregaFactura", query = "SELECT p FROM PedidoDeVenta p WHERE p.fechaEntregaFactura = :fechaEntregaFactura")
    , @NamedQuery(name = "PedidoDeVenta.findByFechaPlazo", query = "SELECT p FROM PedidoDeVenta p WHERE p.fechaPlazo = :fechaPlazo")})
public class PedidoDeVenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "fecha_orden")
    @Temporal(TemporalType.DATE)
    private Date fechaOrden;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "total")
    private Double total;
    @Column(name = "fecha_entrega_factura")
    @Temporal(TemporalType.DATE)
    private Date fechaEntregaFactura;
    @Column(name = "fecha_plazo")
    @Temporal(TemporalType.DATE)
    private Date fechaPlazo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pedidoDeVentaIdPedidoDeVenta")
    private List<DevolucionCliente> devolucionClienteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pedidoDeVenta")
    private List<ProductoPedidoVenta> productoPedidoVentaList;
    @JoinColumn(name = "cliente_cedula", referencedColumnName = "cedula")
    @ManyToOne
    private Cliente clienteCedula;
    @JoinColumn(name = "estado_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Estado estadoId;
    @JoinColumn(name = "personal_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Personal personalId;
    @JoinColumn(name = "tipo_entrega_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TipoEntrega tipoEntregaId;

    public PedidoDeVenta() {
    }

    public PedidoDeVenta(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFechaOrden() {
        return fechaOrden;
    }

    public void setFechaOrden(Date fechaOrden) {
        this.fechaOrden = fechaOrden;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Date getFechaEntregaFactura() {
        return fechaEntregaFactura;
    }

    public void setFechaEntregaFactura(Date fechaEntregaFactura) {
        this.fechaEntregaFactura = fechaEntregaFactura;
    }

    public Date getFechaPlazo() {
        return fechaPlazo;
    }

    public void setFechaPlazo(Date fechaPlazo) {
        this.fechaPlazo = fechaPlazo;
    }

    @XmlTransient
    public List<DevolucionCliente> getDevolucionClienteList() {
        return devolucionClienteList;
    }

    public void setDevolucionClienteList(List<DevolucionCliente> devolucionClienteList) {
        this.devolucionClienteList = devolucionClienteList;
    }

    @XmlTransient
    public List<ProductoPedidoVenta> getProductoPedidoVentaList() {
        return productoPedidoVentaList;
    }

    public void setProductoPedidoVentaList(List<ProductoPedidoVenta> productoPedidoVentaList) {
        this.productoPedidoVentaList = productoPedidoVentaList;
    }

    public Cliente getClienteCedula() {
        return clienteCedula;
    }

    public void setClienteCedula(Cliente clienteCedula) {
        this.clienteCedula = clienteCedula;
    }

    public Estado getEstadoId() {
        return estadoId;
    }

    public void setEstadoId(Estado estadoId) {
        this.estadoId = estadoId;
    }

    public Personal getPersonalId() {
        return personalId;
    }

    public void setPersonalId(Personal personalId) {
        this.personalId = personalId;
    }

    public TipoEntrega getTipoEntregaId() {
        return tipoEntregaId;
    }

    public void setTipoEntregaId(TipoEntrega tipoEntregaId) {
        this.tipoEntregaId = tipoEntregaId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PedidoDeVenta)) {
            return false;
        }
        PedidoDeVenta other = (PedidoDeVenta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "DTO.PedidoDeVenta[ id=" + id + " ]";
    }
    
}
