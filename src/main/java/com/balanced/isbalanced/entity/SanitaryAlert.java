package com.balanced.isbalanced.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.io.Serial;
import java.io.Serializable;

/**
 * Entity {@link SanitaryAlert}
 */
@Entity
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude = "drug")
public class SanitaryAlert implements Serializable {
    @Serial
    private static final long serialVersionUID = 50L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;


    private String link;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "drug")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @JsonBackReference
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Drug drug;

}
